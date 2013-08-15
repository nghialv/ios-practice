//
//  dpRCRecptionist.h
//  testIOS
//
//  Created by Denny C. Dai on 8/14/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RCTaskBlock)(NSString *keyPath, id object, NSDictionary *change);


@interface TestObject : NSObject
@property(nonatomic,copy) NSString* value;
@end

/**
  Receptionist design pattern baed on KVO 
 
 REF https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/ReceptionistPattern/ReceptionistPattern.html#//apple_ref/doc/uid/TP40010810-CH13-SW1
 **/
@interface dpRCRecptionist : NSObject
{
    id observedObject; //the object observed on
    NSString *observedKeyPath; //the property on the object to be observed
    RCTaskBlock task; //client test block to invoke when value changed
    NSOperationQueue *queue; //destination operation queue to run the client task
}

+ (id)receptionistForKeyPath:(NSString *)path object:(id)obj queue:(NSOperationQueue *)queue task:(RCTaskBlock)task;
@end
