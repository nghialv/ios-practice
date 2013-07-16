//
//  abAppDelegate.h
//  testApp1
//
//  Created by Denny C. Dai on 2013-05-28.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface abAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *leftBtn;
@property (weak) IBOutlet NSButton *rightBtn;

@end
