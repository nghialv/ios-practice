//
//  testGCDTests.m
//  testGCDTests
//
//  Created by Denny C. Dai on 7/9/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface testGCDTests : XCTestCase

@end

@implementation testGCDTests

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

- (void)testAsyncCallback
{
    
    
    
}

/**
 **/
-(void)dummy:(id)obj onQueue:(dispatch_queue_t)q {
    
    
    //the entire block is copied to the heap
    dispatch_async(self.queue, ^{
        
        [self performWork];
        
        //the block is created on stack
        //obj is captured by the block, with reference count incremented by 1
        void(^b)(void) = ^{
            [obj callback];
        };
        
        //the block is copied to the heap for async execution
        dispatch_async(q, b);
        
    });
    
}
@end
