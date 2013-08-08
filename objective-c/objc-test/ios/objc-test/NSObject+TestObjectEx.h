//
//  NSObject+TestObjectEx.h
//  objc-test
//
//  Created by Denny C. Dai on 8/7/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
  Class Category
 
 Furthermore, it might not make sense to subclass the existing class, because you may want your drawing behavior available not only to the original NSString class but also any subclasses of that class, like NSMutableString. And, although NSString is available on both OS X and iOS, the drawing code would need to be different for each platform, so you’d need to use a different subclass on each platform.
 
 
 A category can be declared for any class, even if you don’t have the original implementation source code (such as for standard Cocoa or Cocoa Touch classes). Any methods that you declare in a category will be available to all instances of the original class, as well as any subclasses of the original class. At runtime, there’s no difference between a method added by a category and one that is implemented by the original class.
 
 
 As well as just adding methods to existing classes, you can also use categories to split the implementation of a complex class across multiple source code files. You might, for example, put the drawing code for a custom user interface element in a separate file to the rest of the implementation if the geometrical calculations, colors, and gradients, etc, are particularly complicated. Alternatively, you could provide different implementations for the category methods, depending on whether you were writing an app for OS X or iOS.
 

 Categories can be used to declare either instance methods or class methods but are not usually suitable for declaring additional properties. It’s valid syntax to include a property declaration in a category interface, but it’s not possible to declare an additional instance variable in a category. This means the compiler won’t synthesize any instance variable, nor will it synthesize any property accessor methods. You can write your own accessor methods in the category implementation, but you won’t be able to keep track of a value for that property unless it’s already stored by the original class.
 
 The only way to add a traditional property—backed by a new instance variable—to an existing class is to use a class extension,
 **/
@interface NSObject (TestObjectEx)
-(void)extraFunc;
@end
