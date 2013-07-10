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



//subscripting support
@interface MyList : NSObject
@end

@implementation MyList

//support index subscript
- (myObject*)objectAtIndexedSubscript:(NSUInteger)idx{
    return [[myObject alloc] initWithName:@"s"];
}

//support key sbuscript
- (myObject*)objectForKeyedSubscript:(id)key{
    return [[myObject alloc] initWithName:@"s"];
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
