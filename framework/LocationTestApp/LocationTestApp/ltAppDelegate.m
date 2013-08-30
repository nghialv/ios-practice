//
//  ltAppDelegate.m
//  LocationTestApp
//
//  Created by Denny C. Dai on 8/30/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "ltAppDelegate.h"
#import <Location/Location.h>
#import <Location/TestPubObject.h>


@implementation ltAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    TestPubObject *obj = [[TestPubObject alloc] init];
    NSLog(@"test obj: %@", obj);
    
    
    //test loading the bundle
    NSBundle* frameworkBundle = nil;
    NSString* mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString* frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"Location.bundle"];
    
    NSLog(@"loading bundle from path %@", frameworkBundlePath);
    frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    
    NSLog(@"loaded bundle %@", frameworkBundle);
    
    
    //load a storyboard at runtime and use it to drive the app's interface
    //when objects are loaded from the storyboard, they are restored to the state configured in the storyboard
    UIStoryboard* testBoard = [UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle];
    [self.window setRootViewController: [testBoard instantiateInitialViewController]];
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
