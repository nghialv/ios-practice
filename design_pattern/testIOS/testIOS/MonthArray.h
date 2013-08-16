//
//  dpCluster.h
//  testIOS
//
//  Created by Denny C. Dai on 8/15/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Class clusters group a number of private concrete subclasses under a public abstract superclass
 **/
@interface MonthArray : NSArray
{
}

+ (MonthArray*) monthArray;
- (unsigned)count;
- (id)objectAtIndex:(unsigned)index;



@end


////adding a category for NSArray
//@interface NSArray (MonthArray)
//+(NSArray*)monthArray;
//@end
