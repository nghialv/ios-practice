//
//  objc_testTests.m
//  objc-testTests
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestObject.h"

enum MyType : NSInteger{
    MyTypeOne,
    MyTypeTwo
};

typedef enum MyOtherType : NSInteger{
    MyOtherType1,
    MyOtherType2
}MyOtherType;


typedef NS_ENUM(NSUInteger, MyEnum){ABC, JKL, XYZ};

typedef NS_OPTIONS(NSUInteger, MyOptions){
    kFaster = (1 << 3),
    kBetter = (1 << 4),
    kAwesome = (1 << 5)
};


@interface objc_testTests : XCTestCase

@end

@implementation objc_testTests

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

    
    
- (void)testObjC
{

    TestObject* obj = [[TestObject alloc] initWithName:@"denny"];
    NSLog(@"%@",obj);
    
    if(__has_feature(objc_instancetype)) NSLog(@"using objc instancetype");

    
}

@end
