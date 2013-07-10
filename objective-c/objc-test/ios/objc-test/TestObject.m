//
//  TestObject.m
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "TestObject.h"

@interface TestObject(){
    id _ivar1;
    id _ivar2;
}
@end

@implementation TestObject
    
-(void)foo{
    
    //self retain cycle 
    __weak TestObject* weak_self = self;
    _ivar1 = ^{
        
        //predictably accessing weak variables 
        TestObject* tmp_self = weak_self;
        if(tmp_self)
            [tmp_self->_ivar2 class];
    };
}

-(instancetype)initWithName:(NSString*)name{
    if(self = [super init]){
        _name = name;
    }
    return self;
}

    
@end
