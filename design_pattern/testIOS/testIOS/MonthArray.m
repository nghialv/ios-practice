//
//  dpCluster.m
//  testIOS
//
//  Created by Denny C. Dai on 8/15/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "MonthArray.h"

@implementation MonthArray

static MonthArray *sharedMonthArray = nil;
static NSString *months[] = { @"January", @"February", @"March",
    @"April", @"May", @"June", @"July", @"August", @"September",
    @"October", @"November", @"December" };

+ (MonthArray*) monthArray
{
    if (!sharedMonthArray) {
        sharedMonthArray = [[MonthArray alloc] init];
    }
    return sharedMonthArray;
}


/**
 because MonthArray overrides the inherited primitive methods, the derived methods that it inherits will work properly without being overridden. NSArray’s lastObject, containsObject:, sortedArrayUsingSelector:, objectEnumerator, and other methods work without problems for MonthArray objects.
 
 **/
- (unsigned)count
{
    return 12;
}

-(id) objectAtIndex:(unsigned)index
{
    if (index >= [self count]){
        [NSException raise:NSRangeException format:@"***%s: index (%d) beyond bounds (%d)", sel_getName(_cmd), index, [self count] - 1];
        return nil;
    }
    else
        return months[index];
}

@end
