//
//  TestObject.h
//  appMem
//
//  Created by Denny C. Dai on 8/18/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
  Memory Management Notes 
 
 The memory management model is based on object ownership. Any object may have one or more owners. As long as an object has at least one owner, it continues to exist.
 
 * You own any object you create
    * You create an object using a method whose name begins with “alloc”, “new”, “copy”, or “mutableCopy” 
 * You can take ownership of an object using retain
 * When you no longer need it, you must relinquish ownership of an object you own
 * You must not relinquish ownership of an object you do not own
 
 
 
 
 - Use Accessor Methods to Set Property Values
 - Don’t Use Accessor Methods in Initializer Methods and dealloc
 - Use Weak References to Avoid Retain Cycles
 
 
 Examples of weak references in Cocoa include, but are not restricted to, table data sources, outline view items, notification observers, and miscellaneous targets and delegates.
 
 
 **/
@interface TestObject : NSObject
@property(weak) id delegate;
@end
