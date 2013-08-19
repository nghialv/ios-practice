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
