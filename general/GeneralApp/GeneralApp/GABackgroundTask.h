//
//  GABackgroundTask.h
//  GeneralApp
//
//  Created by Denny C. Dai on 7/23/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GATask)(void);

//run task in the background
@interface GABackgroundTask : NSObject

+(void)runBackgroundTask:(GATask)task;
@end
