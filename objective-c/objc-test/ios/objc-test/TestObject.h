//
//  TestObject.h
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

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
-(void)foo; //instance method
+(void)bar; //class method


//manual definition of getter/setter
-(NSInteger)value;
-(void)setValue:(NSInteger)val;
@end
