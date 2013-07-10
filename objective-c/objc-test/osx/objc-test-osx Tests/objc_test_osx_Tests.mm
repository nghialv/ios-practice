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
@end

//subscripting support
@interface MyList : NSObject{
    myObject* _obj;
}
-(myObject*)getObj;
-(myObject*)newObj;

@property(weak) id<MyListProtocol> delegate; //delegate is weak so that it automaticall gets nil

+(void)singletonOp; //singleton operation declared as a class level method
@end

@implementation MyList

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
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        
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
    
    //not nessarily true, as it might not get deallocated yet
    XCTAssert(weakObj==nil, @"a local obj is deallocated, reflected as nil in weak var");

    
    //when out of scope,
    // current value is implicitly releases
    NSLog(@"done");
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
    dict = @{ @"key1" : num, @"key2" : myStr };
    
    
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






@end
