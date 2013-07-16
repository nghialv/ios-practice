//
//  abViewController.h
//  Button
//
//  Created by Denny C. Dai on 2013-05-27.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface abViewController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalSwitchConstraint;
@property (strong, nonatomic) IBOutlet UIView *switchContainer;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;
@end
