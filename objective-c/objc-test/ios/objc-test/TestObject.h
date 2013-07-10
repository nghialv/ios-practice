//
//  TestObject.h
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
@property(nonatomic,strong) NSString* name;
-(instancetype)initWithName:(NSString*)name;
-(void)foo;
@end
