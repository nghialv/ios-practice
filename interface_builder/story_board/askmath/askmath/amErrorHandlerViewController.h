//
//  amErrorHandlerViewController.h
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class amErrorHandlerViewController;
@protocol amErrorHandlerViewControllerDelegate <NSObject>
-(void)amErrorHandlerViewControllerShouldDimiss:(amErrorHandlerViewController*)controller;
@end
@interface amErrorHandlerViewController : UIViewController
@property(nonatomic,assign) id<amErrorHandlerViewControllerDelegate> delegate;
@end
