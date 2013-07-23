//
//  GACapabilityCheck.h
//  GeneralApp
//
//  Created by Denny C. Dai on 7/23/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
  Utility object for checking sevice/functionality availability
 **/
@interface GACapabilityCheck : NSObject
+(BOOL)hasMultiTasking; //check if the host supports multitasking and background execution
@end
