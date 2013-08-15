//
//  dpObject.m
//  testIOS
//
//  Created by Denny C. Dai on 8/15/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "dpObject.h"

@implementation dpObject

/**
 The designated initializer for each class is the initializer with the most coverage; it is the method that initializes the attribute added by the subclass. 
 **/
- (id)initWithAccountID:(NSString *)identifier {
    if ( self = [super init] )
    {
        
    }
    return self;
    
    //conditionally return the initialized object
/*
    {
        Account *ac = [accountDictionary objectForKey:identifier];
        if (ac) { // object with that ID already exists
            [self release];
            return [ac retain];   //return the same object
        }
        if (identifier) {    //normal path to return self
            accountID = [identifier copy]; // accountID is instance variable
            [accountDictionary setObject:self forKey:identifier];
            return self;
        } else {   //invalid initialization condition
            [self release];
            return nil;
        }
    } else
        return nil;
*/
}


@end
