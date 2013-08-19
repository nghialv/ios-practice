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



@end








