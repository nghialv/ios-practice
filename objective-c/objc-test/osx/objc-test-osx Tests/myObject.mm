//
//  myObject.m
//  objc-test-osx
//
//  Created by Denny C. Dai on 7/10/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "myObject.h"

@interface myObject(){
}
@end

@implementation myObject

-(id)initWithName:(NSString *)name{
    if(self = [super init]){
        _name = name; 
    }
    return self;
}

@end
