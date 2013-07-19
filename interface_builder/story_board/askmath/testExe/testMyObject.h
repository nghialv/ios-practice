//
//  testMyObject.h
//  askmath
//
//  Created by Denny C. Dai on 2013-05-31.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testMyObject : NSObject
-(void)foo;
@property(copy) NSString* val;
@property(weak) id myFriend;


//IBOutlet to interface views are in general week reference
//except for top level views we shall use strong

-(id)init;
@end
