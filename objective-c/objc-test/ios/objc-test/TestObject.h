//
//  TestObject.h
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Manage the Object Graph through Ownership and Responsibility

 * When one object relies on other objects in this way, effectively taking ownership of those other objects, the first object is said to have strong references to the other objects. 
 
 * In Objective-C, an object is kept alive as long as it has at least one strong reference to it from another object. 
 
 * By default, both Objective-C properties and variables maintain strong references to their objects. This is fine for many situations, but it does cause a potential problem with strong reference cycles.
 
 * Avoid Strong Reference Cycles
 
 * Even though there is no need for the objects to be kept in memory—there are no strong relationships to the table view or delegate other than the relationships between the two objects—the two remaining strong relationships keep the two objects alive. This is known as a strong reference cycle.
 
 declare a delegate property to be weak reference to break / avoid strong reference cycle
 
 Note: A variable maintains a strong reference to an object only as long as that variable is in scope, or until it is reassigned to another object or nil.

 **/


/**
 Objc adds language-level support for object graph management and object literals while providing dynamic typing and binding, deferring many responsibilities until runtime.

 - An App Is Built from a Network of Objects
 - Categories Extend Existing Classes
 - Protocols Define Messaging Contracts
 - Properties Control Access to an Object’s Values
 - Property Attributes Indicate Data Accessibility and Storage Considerations
 - Method Declarations Indicate the Messages an Object Can Receive
 
 - Objective-C Classes Are also Objects
    * In Objective-C, a class is itself an object with an opaque type called Class
    * Classes can’t have properties defined using the declaration syntax shown earlier for instances, but they can receive messages.
 
 - Class Names Must Be Unique
    * It’s important to note that the name of each class must be unique within an app, even across included libraries or frameworks. 
 
 -  Most Properties Are Backed by Instance Variables
 
 
 - Objects Are Created Dynamically
    * , memory is allocated dynamically for an Objective-C object. The first step in creating an object is to make sure enough memory is allocated not only for the properties defined by an object’s class, but also the properties defined on each of the superclasses in its inheritance chain.
 
    * The NSObject root class provides a class method, alloc, which handles this process for you:
        + (id)alloc;
    * clear out the memory allocated for the object’s properties by setting them to zero. This avoids the usual problem of memory containing garbage from whatever was stored before, but is not enough to initialize an object completely.
 
 
    * - (id)init;
      The init method is used by a class to make sure its properties have suitable initial values at creation, and is covered in more detail in the next chapter.
 
 Note that init also returns an id.
 
 
 id - some kind of object
 **/


//A protocol declares methods that can be implemented by any class. Protocols are not classes themselves. They simply define an interface that other objects are responsible for implementing. When you implement the methods of a protocol in one of your classes, your class is said to conform to that protocol.
@protocol MyProtocol <NSObject>
@required
-(void)myFunc;
@optional
-(void)myOptFunc;
@end

@interface TestObject : NSObject <MyProtocol>

//Decleare public property
//Declared properties are a convenience notation used to replace the declaration and, optionally, implementation of accessor methods.
//Practically speaking, properties reduce the amount of redundant code you have to write.

//DEFAULT is readwrite
//DEFAULT is strong
//Properties Are Atomic by Default
//This means that the synthesized accessors ensure that a value is always fully retrieved by the getter method or fully set via the setter method, even if the accessors are called simultaneously from different threads.


/**
 Note: The compiler will automatically synthesize an instance variable in all situations where it’s also synthesizing at least one accessor method. If you implement both a getter and a setter for a readwrite property, or a getter for a readonly property, the compiler will assume that you are taking control over the property implementation and won’t synthesize an instance variable automatically.
 If you still need an instance variable, you’ll need to request that one be synthesized:
 **/

//nonatomic is faster
//Note: Property atomicity is not synonymous with an object’s thread safety.
//individual property is thread-safe, but the entire object is not thread-safe
@property(nonatomic,strong) NSString* name;


-(instancetype)initWithName:(NSString*)name;
-(id)initWithValue:(NSInteger)val;

-(void)foo; //instance method
+(void)bar; //class method



+(TestObject*)newObject; // a factory class method

//manual definition of getter/setter
-(NSInteger)value;
-(void)setValue:(NSInteger)val;


@property(weak) id delegate; //weak reference delete
@end



