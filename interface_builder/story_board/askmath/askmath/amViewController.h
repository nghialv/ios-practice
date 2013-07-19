//
//  amViewController.h
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class amViewController;

//define required interface from a compatible child controller 
@protocol amViewControllerChildProtocol <NSObject>
// the tab button
// the trigger segue identifier 
@end

@interface amViewController : UIViewController
- (IBAction)onHomeClicked:(id)sender;
- (IBAction)onFormulasClicked:(id)sender;
- (IBAction)onStockClicked:(id)sender;
@property(strong,nonatomic) UIViewController<amViewControllerChildProtocol>* currentController;
-(void)showController:(UIViewController<amViewControllerChildProtocol>*)child;
@end
