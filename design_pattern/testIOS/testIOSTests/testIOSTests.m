//
//  testIOSTests.m
//  testIOSTests
//
//  Created by Denny C. Dai on 8/14/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "dpRCRecptionist.h"

@interface testIOSTests : XCTestCase

@end

@implementation testIOSTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//REF https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/Target-Action/Target-Action.html
/**
 Cocoa uses the target-action mechanism for communication between a control and another object. This mechanism allows the control and, in OS X its cell or cells, to encapsulate the information necessary to send an application-specific instruction to the appropriate object. The receiving object—typically an instance of a custom class—is called the target. The action is the message that the control sends to the target. The object that is interested in the user event—the target—is the one that imparts significance to it, and this significance is usually reflected in the name it gives to the action.
 
 **/
-(void)testTargetAction
{
    //Control objects do not (and should not) retain their targets.
    
    //An action is the message a control sends to the target or, from the perspective of the target,
    //the method the target implements to respond to the action message.
    // A control stores an action as an instance variable of type SEL.
    
    //An action message must have a simple, distinct signature. The method it invokes returns nothing and usually has a sole parameter of type id. This parameter, by convention, is named sender.
    
    //- (IBAction)capitalizeWord:(id)sender;
    
    //Many of the control classes in UIKit are implemented to generate certain control events; for example, instances of the UISlider class generate a UIControlEventValueChanged control event, which you can use to send an action message to a target object.
    
    
}

//TODO - check KVO and return back here 
-(void)testReceptionist
{
    RCTaskBlock task = ^(NSString *keyPath, id object, NSDictionary *change) {
        NSLog(@"property %@ changed %@", keyPath, change);
//        NSView *viewForModel = [modelToViewMap objectForKey:model];
//        NSColor *newColor = [change objectForKey:NSKeyValueChangeNewKey];
//        [[[viewForModel subviews] objectAtIndex:0] setFillColor:newColor];
        
    };
    
    
    TestObject* obj = [TestObject new];
    
    dpRCRecptionist *receptionist = [dpRCRecptionist receptionistForKeyPath:@"value"
                                                                     object:obj
                                                                      queue:[NSOperationQueue mainQueue]
                                                                       task:task];

    //make some changes to obj
    obj.value = @"dennycd";
}
@end
