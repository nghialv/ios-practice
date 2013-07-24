//
//  GAObject.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/20/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GAObject.h"

//ivars and hidden properties goes here 
@interface GAObject(){
    
}
@end

@implementation GAObject

#pragma mark - UIDataSourceModelAssociation

- (NSString *) modelIdentifierForElementAtIndexPath:(NSIndexPath *)idx inView:(UIView *)view
{
    return nil;
}

- (NSIndexPath *) indexPathForElementWithModelIdentifier:(NSString *)identifier inView:(UIView *)view
{
    return nil;
}

@end
