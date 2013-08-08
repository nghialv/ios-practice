//
//  TestObject.h
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

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

//Declared properties are a convenience notation used to replace the declaration and, optionally, implementation of accessor methods.
//Practically speaking, properties reduce the amount of redundant code you have to write.
@property(nonatomic,strong) NSString* name;


-(instancetype)initWithName:(NSString*)name;
-(id)initWithValue:(NSInteger)val;

-(void)foo; //instance method
+(void)bar; //class method



+(TestObject*)newObject; // a factory class method

//manual definition of getter/setter
-(NSInteger)value;
-(void)setValue:(NSInteger)val;
@end



