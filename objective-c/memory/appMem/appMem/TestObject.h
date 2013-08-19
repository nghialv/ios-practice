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
 
 
 *** Don’t Use dealloc to Manage Scarce Resources ***
 
 
 - You should typically not manage scarce resources such as file descriptors, network connections, and buffers or caches in a dealloc method. In particular, you should not design classes so that dealloc will be invoked when you think it will be invoked. Invocation of dealloc might be delayed or sidestepped, either because of a bug or because of application tear-down.
 
 - If an object is autoreleased at an unexpected time, it will be deallocated on whatever thread’s autorelease pool block it happens to be in. This can easily be fatal for resources that should only be touched from one thread.
 
 
 
 
 - Order dependencies on object graph tear-down.
  * The object graph tear-down mechanism is inherently non-ordered

 
 
 Autorelease pool blocks provide a mechanism whereby you can relinquish ownership of an object, but avoid the possibility of it being deallocated immediately (such as when you return an object from a method). 
 
 
 * if obj are sent a release message and retain count goes to 0, it is deallocated right away
 * if obj are sent autorelease message, its retain count remains 1 until end of its nearest enclosing autorelease pool
 * At the end of the autorelease pool block, objects that received an autorelease message within the block are sent a release message—an object receives a release message for each time it was sent an autorelease message within the block.
 
 * Cocoa always expects code to be executed within an autorelease pool block, otherwise autoreleased objects do not get released and your application leaks memory. (If you send an autorelease message outside of an autorelease pool block, Cocoa logs a suitable error message.) The AppKit and UIKit frameworks process each event-loop iteration (such as a mouse down event or a tap) within an autorelease pool block. Therefore you typically do not have to create an autorelease pool block yourself, or even see the code that is used to create one
 
 
 * If you spawn a secondary thread.
 You must create your own autorelease pool block as soon as the thread begins executing; otherwise, your application will leak objects.
 
 
 * Use Local Autorelease Pool Blocks to Reduce Peak Memory Footprint
 
 * Each thread in a Cocoa application maintains its own stack of autorelease pool blocks. If you are writing a Foundation-only program or if you detach a thread, you need to create your own autorelease pool block.
 
 * If you are writing a program that is not based on a UI framework, such as a command-line too, create auto-release pool 
 
 **/
@interface TestObject : NSObject
@property(weak) id delegate;
@end
