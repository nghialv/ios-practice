//
//  GALocalNoti.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/23/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GALocalNoti.h"

@implementation GALocalNoti

/**
  If app in forebound, the app delegate method is called. 
  If app is background, then it sends to system noti center
 **/
//Your own apps can have no more than 128 local notifications active at any given time,
//any of which can be configured to repeat at a specified interval.
+(void)scheduleTestLocalNoti
{
    UIApplication* app = [UIApplication sharedApplication];
    NSArray*    oldNotifications = [app scheduledLocalNotifications];
    
    // Clear out the old notification before scheduling a new one.
    if ([oldNotifications count] > 0)
        [app cancelAllLocalNotifications];
    
    // Create a new notification.
    UILocalNotification* alarm = [[UILocalNotification alloc] init];
    if (alarm)
    {
        alarm.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
        alarm.timeZone = [NSTimeZone defaultTimeZone];
        alarm.repeatInterval = 0;
        alarm.soundName = @"alarmsound.caf";
        alarm.alertBody = @"Hello World!";
        
        [app scheduleLocalNotification:alarm];
    }
    
}

@end
