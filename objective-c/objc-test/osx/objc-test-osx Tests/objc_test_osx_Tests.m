//
//  objc_test_osx_Tests.m
//  objc-test-osx Tests
//
//  Created by Denny C. Dai on 7/10/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>

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

- (void)testExample
{
    XCTAssertTrue(true, @"test passed");
    
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
