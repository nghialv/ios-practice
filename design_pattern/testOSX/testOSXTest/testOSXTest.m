//
//  testOSXTest.m
//  testOSXTest
//
//  Created by Denny C. Dai on 8/14/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface testOSXTest : XCTestCase

@end

@implementation testOSXTest

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

//REF https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/Toll-FreeBridgin/Toll-FreeBridgin.html#//apple_ref/doc/uid/TP40010810-CH2-SW1
- (void)testTollFreeBridging
{
    NSLocale *gbNSLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    CFLocaleRef gbCFLocale = (CFLocaleRef) CFBridgingRetain(gbNSLocale); //+1 reference count
    
    CFStringRef cfIdentifier = CFLocaleGetIdentifier (gbCFLocale); //the get rule does not affect ownership
    NSLog(@"cfIdentifier: %@", (__bridge NSString *)cfIdentifier);//no change in object ownership, simply for print
    // logs: "cfIdentifier: en_GB"
    
    CFRelease((CFLocaleRef) gbNSLocale); //balance the CFBridgingRetain call
    
    CFLocaleRef myCFLocale = CFLocaleCopyCurrent();
    NSLocale * myNSLocale = (NSLocale *) CFBridgingRelease(myCFLocale);
    
    //[myNSLocale autorelease];
    
    NSString *nsIdentifier = [myNSLocale localeIdentifier];
    CFShow((CFStringRef) [@"nsIdentifier: " stringByAppendingString:nsIdentifier]);
    
    // logs identifier for current locale
    
}

//REF https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/Target-Action/Target-Action.html
/**
 Cocoa uses the target-action mechanism for communication between a control and another object. This mechanism allows the control and, in OS X its cell or cells, to encapsulate the information necessary to send an application-specific instruction to the appropriate object. The receiving object—typically an instance of a custom class—is called the target. The action is the message that the control sends to the target. The object that is interested in the user event—the target—is the one that imparts significance to it, and this significance is usually reflected in the name it gives to the action.

 **/
-(void)testTargetAction
{
    //Control objects do not (and should not) retain their targets.
    
    
}

@end






