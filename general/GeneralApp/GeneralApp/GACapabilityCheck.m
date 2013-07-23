//
//  GACapabilityCheck.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/23/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GACapabilityCheck.h"

@implementation GACapabilityCheck

//REF https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/ManagingYourApplicationsFlow/ManagingYourApplicationsFlow.html
+(BOOL)hasMultiTasking{
    UIDevice* device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)])
        backgroundSupported = device.multitaskingSupported;
    return backgroundSupported;
}
@end
