//
//  objc_test_osx_Tests.m
//  objc-test-osx Tests
//
//  Created by Denny C. Dai on 7/10/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <vector>
#import "myObject.h"

//struct with objc object pointer (Objective-C++)
struct MyStruct {
    id              what;
    NSPoint         where;
    NSTimeInterval  when;
};


@protocol MyListProtocol <NSObject>
@optional
-(void)doThisOptionally;
@required
-(void)mustDoThis;
@end


//subscripting support
@interface MyList : NSObject{
    myObject* _obj;  //private
    
    id _ivar;
}
-(myObject*)getObj;
-(myObject*)newObj;
+(void)singletonOp; //singleton operation declared as a class level method

//property declaration represents a contract
@property(copy) NSString* title; //for value style property, usually take a private copy itself
@property(strong) NSArray* list; //for reference to an external container, take ownership and avoid copy !
@property(readonly, nonatomic) float radius; //a characteristic property of the object | this is no atomait
@property(readonly, nonatomic) float area;
@property(weak) id<MyListProtocol> delegate; //delegate is weak so that it automaticall gets nil


//ideally put it in private class extension
//outlets to the subview of a view controller's main view should be weak. it is the main view's responsibility to maintain its subview lifecycle and hierarchy
//outlets to the top level view e.g. main view should be STRONG !!!
@property(strong) IBOutlet NSView* mainView;
@property(weak) IBOutlet NSView* subView;
@end

@implementation MyList

//dealing with retain / strong reference cycle
-(void)noCycle{
    
    //self retain cycle
    __weak MyList* weak_self = self;
    _ivar = ^{
        
        //predictably accessing weak variables
        MyList* tmp_self = weak_self;
        if(tmp_self)
            NSLog(@"%@",tmp_self->_obj);
    };
}

-(void)hasCycle{

    _ivar = ^{

        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
NSLog(@"%@", _obj);
        
#pragma clang diagnostic pop
        
    };
    
}

+(void)singletonOp{
    
    //to guide for thread safety, simply use dispatch_once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"dispatch once only!");
    });
    
}

//retain on the obj and just return
-(myObject *)newObj{
    return [[myObject alloc] initWithName:@"newobj"];
}

//retain _obj, then autorelease it and then return
// this INCREASE the reference count of the obj by 1 !!!!!!
-(myObject *)getObj{
    return _obj;
}

//support index subscript
- (myObject*)objectAtIndexedSubscript:(NSUInteger)idx{
    return [[myObject alloc] initWithName:@"s"];
}

//support key sbuscript
- (myObject*)objectForKeyedSubscript:(id)key{
    return [[myObject alloc] initWithName:@"s"];
}


-(id)init{
    if(self = [super init]){
        _obj = [[myObject alloc] initWithName:@"dummy"];
    }
    return self;
}

-(void)dealloc{
    NSLog(@"MyList::dealloc");
}

@end



@interface objc_test_osx_Tests : XCTestCase

@end

@implementation objc_test_osx_Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


-(void)testRetainCycle{
    
    //no cycle test
    __weak MyList* weak_list;
    {
        MyList* list = [[MyList alloc] init];
        weak_list = list;
    
        [list noCycle];
    }
    
    //list is destroyed , no cycle
    XCTAssert(weak_list == nil, @"");
    
    
    //has cycle test
    weak_list = nil;
    {
        MyList* list = [[MyList alloc] init];
        weak_list = list;
        
        [list hasCycle];
    }
    
    //list and its ivar block are bi-retained
    XCTAssert(weak_list != nil, @"");
}

-(void)testFastEnumeration
{
    NSArray* arr = @[@(1), @(2), @(3)];
    
    for(NSNumber* num in arr){
        NSLog(@"%@",num);
    }

    [arr sortedArrayUsingComparator:^(NSNumber* n1, NSNumber* n2){
        NSComparisonResult result = NSOrderedAscending;
        return result;
    }];
}

-(void)testSingletonPattern{
    [MyList singletonOp];
}

-(void)testMethodReturn {
    
    __weak myObject* weakObj;
    
    
    {
        MyList* list = [[MyList alloc] init];
    
        //the returned obj has ref count 1,
        //localStorng copied it, ref count incre to 2
        //then the returned local obj out of statement scope, its ref count go to 1
        __strong myObject* localStrong = [list newObj];
        
        weakObj = localStrong; //does not retain count
        
        //now list is destroyed, along with its ivar
        //the returned myobj decre count to 0, therefore destroyed
    }
    XCTAssert(weakObj == nil, @"");
    

    {
        MyList* list = [[MyList alloc] init];
        weakObj = [list getObj];
    }
    
    //because of the extra retain while getting access,
    //the local ivar lives beyond list's life cycle, but before next autorelease pool
    //SO, someone need to fix this 
    XCTAssert(weakObj != nil, @"");
    
    
    //now using an explicit autorelease pool
    weakObj = nil;
    @autoreleasepool {
        
        {
            MyList* list = [[MyList alloc] init];
            weakObj = [list getObj];
        }
        
        //because of the extra retain while getting access,
        //the local ivar lives beyond list's life cycle, but before next autorelease pool
        //SO, someone need to fix this
        XCTAssert(weakObj != nil, @"");
    }
    
    //now, autoreleae pool will purge the temporary obj with extra retain due to the access method
    XCTAssert(weakObj==nil, @"");
    
}

-(void)testLocalObj{
    
    __weak myObject* obj;
    {

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"
        
        //so the lifecycle of the obj only lives within a single statement
        obj = [[myObject alloc] initWithName:@"localvar"];
        XCTAssert(obj==nil, @"");
        
#pragma clang diagnostic pop

    }
    
    XCTAssert(obj==nil, @"");
}



/**
  A total of four differenct ownerships
  
  - objective-c, block pointers 
  - local, globals, parameters, instance variables
 
 **/
-(void)testReference{
    
    //all variables default strong
    //like a retain property
    //implicitly initialized to nil - safe for ARC-generated code
    __strong myObject* obj;
    XCTAssert(obj==nil, @"local var initlized to nil under ARC");
    
    
    //reference things we don't want to own, but being able to reach
    //becomes nil as soon as object starts dealloc
    __weak myObject* weakObj;
    
    //like a traditional var, not initialized, no extra logic, no restriction,
    //useful in global structs with constant @"" string
    //__unsafe_unretained myObject* unsafeObj;
    
    {
        myObject* obj1 = [[myObject alloc] initWithName:@"denny"]; //retain count is 1
        
        myObject* obj2;
        
        //we will increase the reference count of the  obj pointed to by str by 1
        //then decrease existing obj reference count on str2 by 1, then copy over
        obj2 = obj1;  //retain count to 2
        
        
        weakObj = obj1;
        XCTAssert(weakObj!=nil,@"");
        
        //when out of scope, local object gets reference count to zero, deallocated
    }
    
    //local obj get deallocated
    XCTAssert(weakObj==nil, @"a local obj is deallocated, reflected as nil in weak var");

    
    //
    NSObject * __weak someObject = [[NSObject alloc] init];
    XCTAssert(someObject==nil, @"");
    
    //when out of scope,
    // current value is implicitly releases
    NSLog(@"done");
}

/**
 An unsafe reference is similar to a weak reference in that it doesn’t keep its related object alive, but it won’t be set to nil if the destination object is deallocated. This means that you’ll be left with a dangling pointer to the memory originally occupied by the now deallocated object, hence the term “unsafe.” Sending a message to a dangling pointer will result in a crash.
 **/
-(void)testUnsafeUnretained
{
    //on property @property (unsafe_unretained) NSObject *unsafeProperty;
    
    NSObject * __unsafe_unretained unsafeReference; // a local var
}

-(void)testObjectLiteral{
    
    //ns number
    NSNumber* num;
    num = @12;
    num = @12.234;
    num = @YES;
    num = @(12 + M_PI);
    XCTAssertTrue(num, @"");
    
    //from c-str
    // must be \0 terminated, UTF-8 or ASCII
    // must not be NULL
    NSString* myStr = @("dennycd");
    NSLog(@"%@",myStr);
    
    //array
    NSArray* myArr = @[num, myStr]; NSLog(@"%@", myArr);
    
    //dictionary
    NSDictionary* dict;
    dict = @{};
    dict = @{@"key" : num};
    
    dict = @{ @"key1" : num,
              @"key2" : myStr
            };
    
    
    //object liternal are immutable
    NSMutableArray *mutArr = [ @[] mutableCopy];
    NSLog(@"%@",mutArr);

    //NSString* const key = NSFilePosixPermissions;
    
    //dictionary literal is not a compile time constant to initialize a static value
    //static NSDictionary* mydict = @{};
    
    //array literals is not a compile time constant to initialize a static value
    //static NSArray* thePlanets = @[@"ss", @"sfd"];
    
    
    //array subscript - indexed subscripting
    NSLog(@"%@",myArr[0]);
    
    //equivilent to
    NSLog(@"%@",[myArr objectAtIndexedSubscript:0]);
    
    //dict subscript - key subscripting
    NSLog(@"%@", dict[@"key"]);
    NSLog(@"%@", [dict objectForKeyedSubscript:@"key"]);
    
    //custom object support for subscripting
    MyList* list = [[MyList alloc] init];
    NSLog(@"%@", list[0]);
    NSLog(@"%@", list[@"key"]);
    
    
}


-(void)testEnumerator{
    NSArray* arr = @[@"dennycd", @(1), @"chendai"];
    
    //fast enum. the collection object must conforms to NSFastEnumeration protocol
    for(id elem in arr) NSLog(@"%@",elem);
    
    
    NSEnumerator* it = [arr reverseObjectEnumerator];
    id obj;
    while (obj = [it nextObject]) {
        NSLog(@"%@", obj);
    }
}

/**
 Blocks are a language-level feature added to C, Objective-C and C++, which allow you to create distinct segments of code that can be passed around to methods or functions as if they were values. 
 
 Blocks are Objective-C objects, which means they can be added to collections like NSArray or NSDictionary. They also have the ability to capture values from the enclosing scope, making them similar to closures or lambdas in other programming languages.
 
 **/
-(void)testBlock{
 
    //a block variable
    void (^simpleBlock)(void);
    double (^multiplyTwoValues)(double, double); //takes two arg and returns a val
    
    //typdef a block variable type
    typedef void(^SimpleBlock)(void);
    typedef double(^MultiplyTwoValues)(double,double);
    
    //declare a block var
    //a block literal and assign it to a block variable
    SimpleBlock blk = ^{
        NSLog(@"block code");
    };

    //block invocation
    blk();
    
    MultiplyTwoValues blk2 = ^double(double val1, double val2){
        NSLog(@"%f, %f", val1, val2);
        return val1+val2;
    };
    blk2(12.2f,2.32f);
    

    
    //Use __block Variables to Share Storage
    // This means that the variable lives in storage that is shared between the
    //lexical scope of the original variable and any blocks declared within that scope.
    {
        __block int anInteger = 42;
        
        void (^testBlock)(void) = ^{
            NSLog(@"Integer is: %i", anInteger);
        };
        
        anInteger = 84;
        
        testBlock(); //84
    }
    
    
    NSArray* arr = @[@"denny", @"chen", @"dai"];
    [arr enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%ld: %@", idx, obj);
    }];
    
}


-(void)testOperationQueue{
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"some block operation");
    }];
    
    // schedule task on main queue:
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [mainQueue addOperation:operation];
    
    // schedule task on background queue:
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation];
    
}


-(void)testError{
    
    //In order to create your own NSError objects you’ll need to define your own error domain
    NSString *domain = @"com.MyCompany.MyApplication.ErrorDomain";
    
    //You’ll also need to pick a unique error code for each error that may occur in your domain, along with a suitable description, which is stored in the user info dictionary for the error, like this:
    NSString *desc = NSLocalizedString(@"Unable to…", @"");
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
    
    NSError *error = [NSError errorWithDomain:domain
                                         code:-101
                                     userInfo:userInfo];
    NSLog(@"%@", error);
}

//Exceptions Are Used for Programmer Errors
//NSException
//you should avoid throwing exceptions in an app that you ship to users.
-(void)testException{
    @try {
        @throw [NSException exceptionWithName:@"DummyException" reason:@"no reason" userInfo:nil];
    }
    @catch (NSException *exception) {
        NSLog(@"catching exp: %@", exception);
    }
    @finally {
        NSLog(@"finalizing code");
    }
}



//Class Names Must Be Unique Across an Entire App
//Your own classes should use three letter prefixes.
//You should also name your classes using a noun that makes it clear what the class represents,
//If multiple words are needed in a class name, you should use camel case by capitalizing the first letter of each subsequent word.
//If a method returns a value, for example, the first word normally indicates what will be returned
//If a method includes an error pointer parameter to be set if an error occurred, this should be the last parameter to the method. If a method takes a block, the block parameter should be the last parameter in order to make any method invocations as readable as possible when specifying a block inline.

//Class factory methods should always start with the name of the class (without the prefix) that they create, with the exception of subclasses of classes with existing factory methods. In the case of the NSArray class, for example, the factory methods start with array. The NSMutableArray class doesn’t define any of its own class-specific factory methods, so the factory methods for a mutable array still begin with array.

//the compiler judges which rule it should follow based on the name of the creation method. Objects created via factory methods are managed slightly differently from objects that are created through traditional allocation and initialization or new because of the use of autorelease pool blocks.


-(void)testDynamism{
    
    //dynamic typing: waiting until compile time to decide the obj type
    //It permits associations between objects to be determined at runtime, rather than forcing them to be encoded in a static design.
    id obj = nil;
    obj  = [[myObject alloc] init];
    
    //dynamic binding:
    //delaying the decision of exactly which method to perform until the program is running.
    /**
     Messages invoke methods indirectly. Every message expression must find a method implementation to “call.” To find that method, the messaging machinery must check the class of the receiver and locate its implementation of the method named in the message. When this is done at runtime, the method is dynamically bound to the message. When it’s done by the compiler, the method is statically bound.
     **/
    
    //invoking a non-existing method will CRASH the app
    @try {
        [obj performSelector:@selector(someBadFunc)];
        XCTAssert(false, @"should crash ");
    }
    @catch (NSException *exception) {
        NSLog(@"exception %@", exception);
    }
    @finally {

    }

    //but sending a message to nil object has no effect and returns nil
    XCTAssertTrue(nil == [obj name], @"send msg to nil returns nil");
    
    //Dynamic typing and binding also open the possibility that the code you write can send messages to objects not yet invented.
    
    
    //Dynamic Loading
    //check at runtime if a class is available to use
    
    Class CLS = NSClassFromString(@"myObject");
    XCTAssertTrue(CLS != nil, @"myObject must be available");
    
    //whether an instance of a  class type will respond to the method
    XCTAssertTrue([myObject instancesRespondToSelector:@selector(name)]);

}


@end






