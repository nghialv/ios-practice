//
//  dpObject.h
//  testIOS
//
//  Created by Denny C. Dai on 8/15/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol dpProtocol <NSObject>
-(void)dummyfunc;
@end

@interface dpObject : NSObject <dpProtocol>

/**
  REF https://developer.apple.com/library/ios/documentation/General/Conceptual/CocoaEncyclopedia/Outlets/Outlets.html#//apple_ref/doc/uid/TP40010810-CH10-SW1
 
 The connections between the containing object and its outlets are reestablished every time the containing object is unarchived from its nib file.
 
 
 An application typically sets outlet connections between its custom controller objects and objects on the user interface, but they can be made between any objects that can be represented as instances in Interface Builder, even between two custom objects.
 
 Check  testIB.xib for thw tow object dpObject and keywords
 
 an instance of dpObject and NSArray is stored in a nib file, when unarchived they are both instantiated and connection established in-between them
 **/
@property(weak) IBOutlet NSArray* keywords;


- (id)initWithAccountID:(NSString *)identifier;
@end
