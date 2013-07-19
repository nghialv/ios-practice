//
//  testMyObject.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-31.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "testMyObject.h"

@interface testMyObject(){
    
}
@end

@implementation testMyObject
{
    int _value;
}

-(id)init
{
    self = [super init];
    if(self){
        _val = @"dennycd"; //use instance variables directly, but do not use property accessor methods ! 
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"testMyObject dealloc");
}
 
-(void)foo
{
    NSLog(@"foo");
}

@end
