//
//  main.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "GAUIApplication.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv,
                                 NSStringFromClass([GAUIApplication class]),
                                 NSStringFromClass([AppDelegate class]));
    }
}
