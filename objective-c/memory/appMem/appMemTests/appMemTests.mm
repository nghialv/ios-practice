//
//  appMemTests.m
//  appMemTests
//
//  Created by Denny C. Dai on 7/15/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestObject.h"
#import "TestCpp.h"

@interface appMemTests : XCTestCase

@end

@implementation appMemTests

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

- (void)testARC
{
    //a number of variable qualifiers introduced in ARC
    
    //__strong
    //__weak
    //__unsafe_unretained
    //__autoreleasing
    
    TestObject* __strong obj = [TestObject new];
    TestObject* __weak objref = obj;
    
    
    //be careful while using weak on the stack
    //the obj without strong ref will get deallocted after its expression
    NSString * __weak string = [[NSString alloc] initWithFormat:@"hello"];
    NSLog(@"string: %@", string);
    
    
    //Using ARC, strong, weak, and autoreleasing stack variables are now implicitly initialized with nil. For example:
    NSString* tmp;
    XCTAssert(tmp==nil, @"local var is init to nil");
}

/**
  _autoreleasing is used to denote arguments that are passed by reference (id *) and are autoreleased on return.
 
 **/
-(void)testAutoReleasing
{
    TestObject* obj = [TestObject new];
    
    {
        NSError* __strong err;
        [obj performOperationWithError:&err];
        NSLog(@"error info %@", err);
    }
    //compiler will actuall produce this following
    {
        NSError* __strong err;
        NSError* __autoreleasing tmp;
        [obj performOperationWithError:&tmp];
        err = tmp;
        NSLog(@"error info %@", err);
    }
}


-(void)testAutoReleasePool
{
    //On entry, an autorelease pool is pushed. On normal exit (break, return, goto, fall-through, and so on) the autorelease pool is popped. For compatibility with existing code, if exit is due to an exception, the autorelease pool is not popped.
    
    @autoreleasepool {
        
    }
}

//The pattern you should typically adopt is: outlets should be weak, except for those from File’s Owner to top-level objects in a nib file (or a storyboard scene) which should be strong


//You enable ARC using a new -fobjc-arc compiler flag. You can also choose to use ARC on a per-file basis if it’s more convenient for you to use manual reference counting for some files. For projects that employ ARC as the default approach, you can disable ARC for a specific file using a new -fno-objc-arc compiler flag for that file

/**
  The compiler does not automatically manage the lifetimes of Core Foundation objects; you must call CFRetain and CFRelease (or the corresponding type-specific variants) as dictated by the Core Foundation memory management rules 
 
 __bridge transfers a pointer between Objective-C and Core Foundation with no transfer of ownership.
 __bridge_retained or CFBridgingRetain casts an Objective-C pointer to a Core Foundation pointer and also transfers ownership to you.
 You are responsible for calling CFRelease or a related function to relinquish ownership of the object.
 
 __bridge_transfer or CFBridgingRelease moves a non-Objective-C pointer to Objective-C and also transfers ownership to ARC.
 ARC is responsible for relinquishing ownership of the object.
 
 **/
-(void)testCoreFoundation
{
//    NSString *name = (NSString *)CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
//    NSLog(@"Person's first name: %@", name);
    
    //The compiler understands Objective-C methods that return Core Foundation types follow the historical Cocoa naming conventions
    //You must still use an appropriate type cast
    
    NSMutableArray *colors = [NSMutableArray arrayWithObject:(id)[[UIColor darkGrayColor] CGColor]];
    [colors addObject:(id)[[UIColor lightGrayColor] CGColor]];

    
    //the array passed to the CGGradientCreateWithColors function requires an appropriate cast. Ownership of the object returned by arrayWithObjects: is not passed to the function, thus the cast is __bridge.
//    NSArray *colors = <#An array of colors#>;
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
}

/**
 How do blocks work in ARC?
 
 Blocks “just work” when you pass blocks up the stack in ARC mode, such as in a return. You don’t have to call Block Copy any more. You still need to use [^{} copy] when passing “down” the stack into arrayWithObjects: and other methods that do a retain.
 
 The one thing to be aware of is that NSString * __block myString is retained in ARC mode, not a possibly dangling pointer. To get the previous behavior, use __block NSString * __unsafe_unretained myString or (better still) use __block NSString * __weak myString.
 
 **/
-(void)testARCWithBlock
{
    
}

//create a C array of retained pointers under ARC?
/**
 There are a number of aspects to note:
 
 You will need to write __strong SomeClass ** in some cases, because the default is __autoreleasing SomeClass **.
 The allocated memory must be zero-filled.
 You must set each element to nil before freeing the array (memset or bzero will not work).
 You should avoid memcpy or realloc.
 
 
 https://developer.apple.com/library/ios/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html
 **/
-(void)testCArray
{
    /*
    // Note calloc() to get zero-filled memory.
    __strong SomeClass **dynamicArray = (__strong SomeClass **)calloc(entries, sizeof(SomeClass *));
    for (int i = 0; i < entries; i++) {
        dynamicArray[i] = [[SomeClass alloc] init];
    }
    
    // When you're done, set each entry to nil to tell ARC to release the object.
    for (int i = 0; i < entries; i++) {
        dynamicArray[i] = nil;
    }
    free(dynamicArray);
    */
}


// ARC work in ObjC++ mode?
//Yes. You can even put strong/weak ids in classes and containers. The ARC compiler synthesizes retain/release logic in copy constructors and destructors etc to make this work.


@end








