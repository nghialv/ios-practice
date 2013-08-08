//
//  NSObject_TestObjectExt.h
//  objc-test
//
//  Created by Denny C. Dai on 8/7/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 
 If you intend to make “private” methods or properties available to select other classes, such as related classes within a framework, you can declare the class extension in a separate header file and import it in the source files that need it. It’s not uncommon to have two header files for a class, for example, such as XYZPerson.h and XYZPersonPrivate.h. When you release the framework, you only release the public XYZPerson.h header file.
 
 **/

//anonymous categories.
//Class Extensions Extend the Internal Implementation
//A class extension bears some similarity to a category, but it can only be added to a class for which you have the source code at compile time (the class is compiled at the same time as the class extension). The methods declared by a class extension are implemented in the @implementation block for the original class so you can’t, for example, declare a class extension on a framework class, such as a Cocoa or Cocoa Touch class like NSString.
//the compiler will automatically synthesize the relevant accessor methods, as well as an instance variable, inside the primary class implementation.

//If you add any methods in a class extension, these must be implemented in the primary implementation for the class.

//It’s also possible to use a class extension to add custom instance variables. These are declared inside braces in the class extension interface:
@interface TestSubObject (){
    NSString* _publicIvar; //a publicly known ivar decalred in a class extention header
}
@property(copy) NSString* extraName;

//-(void)invalidFunc; //you can declare a method, but its implementation must be present in TestSubObject's primary implementation block
@end
