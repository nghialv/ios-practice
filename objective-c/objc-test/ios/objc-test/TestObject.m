//
//  TestObject.m
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "TestObject.h"

@interface TestObject(){
    //hidden instance variables
    
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

+(TestObject *)newObject
{
    return [[TestObject alloc] init];
}

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
    NSLog(@"TestObject::foo");
}


+(void)bar
{
    NSLog(@"bar");
}

-(id)initWithValue:(NSInteger)val
{
    if(self = [super init]){
        _name = @"";
        _value = val;
    }
    return self;
}

-(instancetype)initWithName:(NSString*)name{
    if(self = [super init]){
        _name = name;
        _value = 11;
    }
    return self;
}

/**
 
 You should always access the instance variables directly from within an initialization method because at the time a property is set, the rest of the object may not yet be completely initialized. Even if you don’t provide custom accessor methods or know of any side effects from within your own class, a future subclass may very well override the behavior.
 
 If an object declares one or more initialization methods, you should decide which method is the designated initializer. This is often the method that offers the most options for initialization (such as the method with the most arguments), and is called by other methods you write for convenience **/
//called if invoking [TestObject new]
-(id)init{
    NSLog(@"TestObject::init");
    if(self = [super init]){
        
        //Access Instance Variables Directly from Initializer Methods
        _name = @""; //the auto-synthesized ivar from property <name>
        _value = 11;
    }
    return self;
}

    
@end
