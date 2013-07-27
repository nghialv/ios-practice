//
//  GACapabilityCheck.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/23/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GACapabilityCheck.h"

@implementation GACapabilityCheck

//Any app that supports a range of iOS versions must use runtime checks to prevent the use of newer
//APIs on older versions of iOS that do not support them.

+(NSString *)deviceSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+(NSUInteger)deviceSystemMajorVersion
{
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}

//Apps that link against iOS SDK 4.1 and earlier must use the NSClassFromString function to see whether a class is defined
+(BOOL)isClassExist:(NSString *)cls
{
    Class CLS = NSClassFromString(cls);
    return (CLS != nil);
}


//whether an instance of the class type will respond to the method
+(BOOL)isInstanceMethodExist:(SEL)sel ForClass:(Class)cls
{
    return [cls instancesRespondToSelector:sel];
}

//REF https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/ManagingYourApplicationsFlow/ManagingYourApplicationsFlow.html
+(BOOL)hasMultiTasking{
    UIDevice* device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)])
        backgroundSupported = device.multitaskingSupported;
    return backgroundSupported;
}


+(BOOL)isRunningiPad
{
    //if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    if([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]){
        if([UIDevice currentDevice].userInterfaceIdiom  == UIUserInterfaceIdiomPhone)
            return YES;
        else
            return NO;
    }
    else return NO;
}

@end
