//
//  GASysConfig.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/24/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GASysConfig.h"

@implementation GASysConfig
-(void)toggleHomeLock:(BOOL)enable
{
    [UIApplication sharedApplication].idleTimerDisabled = !enable;
}
@end
