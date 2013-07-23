//
//  GABackgroundTask.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/23/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GABackgroundTask.h"

@implementation GABackgroundTask


+(void)runBackgroundTask:(GATask)task{
    
    //the handler is called if the task is taking too long before the quota runs out
    __block UIBackgroundTaskIdentifier bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        // Clean up any unfinished task business by marking where you stopped or ending the task outright.
        
        //then end it
        [[UIApplication sharedApplication] endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    
    // Start the long-running task async on a global concurrent queue and return immediately.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // Do the work associated with the task, preferably in chunks.
        task();
        
        //check how many remaining time left
        //usually can be 10 minutes !!
        NSLog(@"REMAIN: %d seconds", (NSInteger)[UIApplication sharedApplication].backgroundTimeRemaining);
        
        //task done before time quota, normal exit
        [[UIApplication sharedApplication] endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    });
    
}
@end
