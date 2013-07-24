//
//  AppDelegate.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "AppDelegate.h"
#import "GACapabilityCheck.h"
#import "GABackgroundTask.h"
#import "GALocalNoti.h"

/**
 In iOS 5 and later, you can use the app delegate to handle other app-related events. The Xcode project templates declare the app delegate as a subclass of UIResponder. If the UIApplication object does not handle an event, it dispatches the event to your app delegate for processing.
  see UIResponder Class Reference.
 **/
@implementation AppDelegate

//enable ui state preservation and restoration
//https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/StatePreservation/StatePreservation.html#//apple_ref/doc/uid/TP40007072-CH11-SW13
-(BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

-(BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

//Encode and decode any version information or additional state information for your app
//do some high level info
-(void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"willEncodeRestorableStateWithCoder");
}

-(void)application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"didDecodeRestorableStateWithCoder");
}

//-(UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
//{
//    
//}

//If the app is active and therefore running in the foreground, the method is called instead.
//otherwise the noti is displayed on the device 
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"local noti");
}

/**
 If your app does not use view controllers for some reason, you must respond to status bar frame changes manually by registering for the UIApplicationDidChangeStatusBarFrameNotification notification. Your handler for this notification should get the status bar height and use it to adjust the height of your app’s views appropriately.
 **/
-(void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame
{
    NSLog(@"didChangeStatusBarFrame");
}

/**
Your application:willFinishLaunchingWithOptions: and application:didFinishLaunchingWithOptions: methods should always be as lightweight as possible to reduce your app’s launch time. Apps are expected to launch and initialize themselves and start handling events in less than 5 seconds. If an app does not finish its launch cycle in a timely manner, the system kills it for being unresponsive. Thus, any tasks that might slow down your launch (such as accessing the network) should be executed asynchronously on a secondary thread.
 
 **/
//If your app does not automatically load a main storyboard or nib file at launch time, you can use the
// application:willFinishLaunchingWithOptions: method to prepare your app’s window for display.
//This method is your app’s first chance to execute code at launch time.
-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"willFinishLaunchingWithOptions");
    return YES;
}

/**
 Check the contents of the launch options dictionary for information about why the app was launched, and respond appropriately.
 Initialize the app’s critical data structures.
 Prepare your app’s window and views for display.
 Apps that use OpenGL ES should not use this method to prepare their drawing environment. Instead, they should defer any OpenGL ES drawing calls to the applicationDidBecomeActive: method.
 **/
//This method allows you to perform any final initialization before your app is displayed to the user.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"didFinishLaunchingWithOptions");

    //check whether we are launched into foreground or background
    BOOL background = [UIApplication sharedApplication].applicationState == UIApplicationStateBackground;
    NSLog(@"%@", background ? @"BACKGROUND" : @"FOREGROUND");
    
    
    NSLog(@"MultiTasking: %@", [GACapabilityCheck hasMultiTasking] ? @"YES" : @"NO");
    
    
    //test schedule a local noti
    [GALocalNoti scheduleTestLocalNoti];
    
    // Override point for customization after application launch.
    return YES;
}

/**
 Stop timers and other periodic tasks.
 Stop any running metadata queries.
 Do not initiate any new tasks.
 Pause movie playback (except when playing back over AirPlay).
 Enter into a pause state if your app is a game.
 Throttle back OpenGL ES frame rates.
 Suspend any dispatch queues or operation queues executing non-critical code. (You can continue processing network requests and other time-sensitive background tasks while inactive.)
 
 **/
//Lets you know that your app is transitioning away from being the foreground app. Use this method to put your app into a quiescent state.

/**
 When the user presses the Sleep/Wake button, apps with files protected by the NSFileProtectionComplete protection option must close any references to those files. For devices configured with an appropriate password, pressing the Sleep/Wake button locks the screen and forces the system to throw away the decryption keys for files with complete protection enabled. While the screen is locked, any attempts to access the corresponding files will fail. So if you have such files, you should close any references to them in your applicationWillResignActive: method and open new references in your applicationDidBecomeActive: method.
 
 **/
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//Lets you know that your app is now running in the background and may be suspended at any time.
/**
 Prepare to have their picture taken. When the applicationDidEnterBackground: method returns, the system takes a picture of your app’s user interface and uses the resulting image for transition animations. If any views in your interface contain sensitive information, you should hide or modify those views before the applicationDidEnterBackground: method returns.
 Save user data and app state information. All unsaved changes should be written to disk when entering the background. This step is necessary because your app might be quietly killed while in the background for any number of reasons. You can perform this operation from a background thread as needed.
 Free
 **/

/**
 Your app delegate’s applicationDidEnterBackground: method has approximately 5 seconds to finish any tasks and return. In practice, this method should return as quickly as possible. If the method does not return before time runs out, your app is killed and purged from memory. If you still need more time to perform tasks, call the beginBackgroundTaskWithExpirationHandler: method to request background execution time and then start any long-running tasks in a secondary thread. Regardless of whether you start any background tasks, the applicationDidEnterBackground: method must still exit within 5 seconds.
 **/
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
    
    [GABackgroundTask runBackgroundTask:^{
        NSLog(@"running some background tasking here...");
    }];
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//Lets you know that your app is moving out of the background and back into the foreground, but that it is not yet active.
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

// For apps that support both portrait and landscape orientations, always set up the root view controller of your main window in a portrait orientation. If the device is in a different orientation at launch time, the system tells the root view controller to rotate your views to the correct orientation before displaying the window.


//Lets your app know that it is about to become the foreground app. Use this method for any last minute preparation.

/**
 When your app is moved back to the active state, its applicationDidBecomeActive: method should reverse any of the steps taken in the applicationWillResignActive: method. Thus, upon reactivation, your app should restart timers, resume dispatch queues, and throttle up OpenGL ES frame rates again. However, games should not resume automatically; they should remain paused until the user chooses to resume them.
 **/
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive");

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//Lets you know that your app is being terminated. This method is not called if your app is suspended.
- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
