//
//  TestObject.m
//  appMem
//
//  Created by Denny C. Dai on 8/18/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

/**
 You may implement a dealloc method if you need to manage resources other than releasing instance variables. You do not have to (indeed you cannot) release instance variables, but you may need to invoke [systemClassInstance setDelegate:nil] on system classes and other code that isn’t compiled using ARC.
 
 Custom dealloc methods in ARC do not require a call to [super dealloc] (it actually results in a compiler error). The chaining to super is automated and enforced by the compiler.
 
 **/

//Because ARC does not automate malloc/free, management of the lifetime of Core Foundation objects, file descriptors, and so on, you still free such resources by writing a dealloc method.

//You do not have to (indeed cannot) release instance variables, but you may need to invoke [self setDelegate:nil] on system classes and other code that isn’t compiled using ARC.

//dealloc methods in ARC do not require—or allow—a call to [super dealloc]; the chaining to super is handled and enforced by the runtime.

-(void)dealloc
{
    
}


-(void)setNewTitle:(NSString *)newTitle
{
    ;
}

-(NSString *)theNewTitle
{
    return @"newtitle";
}

-(BOOL)performOperationWithError:(NSError * __autoreleasing *)error
{
    //error is passed by reference, and autoreleased on return
    *error = [[NSError alloc] initWithDomain:@"dennycd.me" code:1 userInfo:nil];
    return YES;
}



@end
