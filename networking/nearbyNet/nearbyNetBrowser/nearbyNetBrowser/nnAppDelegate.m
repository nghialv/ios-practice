//
//  nnAppDelegate.m
//  nearbyNetBrowser
//
//  Created by Denny C. Dai on 8/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "nnAppDelegate.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface nnAppDelegate () <MCSessionDelegate, MCBrowserViewControllerDelegate>
{
    MCBrowserViewController* __strong _browserVC;
}
@end

@implementation nnAppDelegate
    
#pragma mark - MCBrowserViewControllerDelegate
// Notifies the delegate, when the user taps the done button
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    NSLog(@"browserViewControllerDidFinish");
}

// Notifies delegate that the user taps the cancel button.
- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    NSLog(@"browserViewControllerWasCancelled");
}

#pragma mark - MCSessionDelegate
// Remote peer changed state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{

}

// Received data from remote peer
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{

}

// Received a byte stream from remote peer
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{

}

// Start receiving a resource from remote peer
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{

}

// Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{

}

#pragma mark -
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //identify self
    MCPeerID *myPeerID = [[MCPeerID alloc] initWithDisplayName:@"browser"];
    
    //session object
    MCSession* session = [[MCSession alloc] initWithPeer:myPeerID];
    
    //session delegate
    session.delegate = self;
    
    
    _browserVC = [[MCBrowserViewController alloc] initWithServiceType:@"boltzmann" session:session];
    _browserVC.delegate = self;
    
    
    [self.window setRootViewController:_browserVC];
    
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
