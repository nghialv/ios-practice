//
//  GeneralAppTests.m
//  GeneralAppTests
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GACapabilityCheck.h"

@interface GeneralAppTests : XCTestCase

@end

@implementation GeneralAppTests

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

- (void)testDeviceCapability
{
    NSString* version = [GACapabilityCheck deviceSystemVersion];
    NSLog(@"verison = %@", version);
}

@end
