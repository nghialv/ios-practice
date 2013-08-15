//
//  dpRCRecptionist.m
//  testIOS
//
//  Created by Denny C. Dai on 8/14/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "dpRCRecptionist.h"

@implementation dpRCRecptionist

+ (id)receptionistForKeyPath:(NSString *)path object:(id)obj queue:(NSOperationQueue *)queue task:(RCTaskBlock)task {
    
    
    dpRCRecptionist *receptionist = [dpRCRecptionist new];
    
    //can use pointer from within the class
    receptionist->task = [task copy];
    receptionist->observedKeyPath = [path copy];
    receptionist->observedObject = obj; //[obj retain];
    receptionist->queue = queue; //[queue retain];
    
    [obj addObserver:receptionist forKeyPath:path options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:0];
    
    
    return receptionist; //[receptionist autorelease];
}

//support for KVO - get notified when the observing value changes 
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [queue addOperationWithBlock:^{
        task(keyPath, object, change);
    }];
}

@end


@implementation TestObject
@end