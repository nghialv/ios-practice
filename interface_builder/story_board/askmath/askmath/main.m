//
//  main.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "amAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        //the app instantiates the delegate objects using the passed delegate class 
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([amAppDelegate class]));
    }
}
