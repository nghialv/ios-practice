//
//  TestObject.m
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "TestObject.h"

@interface TestObject(){
    id _ivar1;  //instance variables a.k.a ivars
    id _ivar2;  //weak typing
    NSString* myname; //strong typing with explicit class name
    
    NSInteger _value;
}
@end

@implementation TestObject

#pragma mark - MyProtocol
-(void)myFunc
{
    NSLog(@"TestObject::myFunc");
}

#pragma mark  -

-(NSInteger)value
{
    return _value;
}


-(void)setValue:(NSInteger)val
{
    _value = val;
}


/**
 When you want to call a method, you do so by messaging an object. A message is the method signature, along with the parameter information the method needs. All messages you send to an object are dispatched dynamically, thus facilitating the polymorphic behavior of Objective-C classes.
 **/
-(void)foo{
    NSLog(@"foo");
}


+(void)bar
{
    NSLog(@"bar");
}

-(instancetype)initWithName:(NSString*)name{
    if(self = [super init]){
        _name = name;
        _value = 11;
    }
    return self;
}

    
@end
