//
//  myObject.h
//  objc-test-osx
//
//  Created by Denny C. Dai on 7/10/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myObject : NSObject
@property(strong) NSString* name;
-(id)initWithName:(NSString*)name;

//Copy Properties Maintain Their Own Copies
//The copy attribute means that the property will use a strong reference, because it must hold on to the new object it creates.
//Any object that you wish to set for a copy property must support NSCopying, which means that it should conform to the NSCopying protocol.
@property(copy) NSString* value;
@end
