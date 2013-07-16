//
//  abViewController.m
//  Button
//
//  Created by Denny C. Dai on 2013-05-27.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "abViewController.h"

@interface abViewController ()

@end

@implementation abViewController

-(void)updateViewConstraints
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    
//    //Add Cancel and Accept Buttons
//    UIButton* cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
//    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
//    [self.switchContainer addSubview:cancelBtn];
//    
//    
//    UIButton* acceptBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    acceptBtn.translatesAutoresizingMaskIntoConstraints = NO;
//    [acceptBtn setTitle:@"Accept" forState:UIControlStateNormal];
//    [self.switchContainer addSubview:acceptBtn];
//    
//    NSDictionary* viewsDict = NSDictionaryOfVariableBindings(cancelBtn,acceptBtn);
//    NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[cancelBtn]" options:0 metrics:nil views:viewsDict];
//    
//    [self.switchContainer addConstraints:constraints];
//    //visual format
//   
//    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[cancelBtn]-[acceptBtn(==cancelBtn)]|"
//                                                                   options:NSLayoutFormatAlignAllBaseline
//                                                                   metrics:nil
//                                                                     views:viewsDict];
//    [self.switchContainer addConstraints:constraints];
    
    

    
//    
//    //remove the IB-generated constraint centering the switch in its superview 
//    [self.switchContainer removeConstraint:self.horizontalSwitchConstraint];
//    
//    //add a new constraint centering the switch on the button
//    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:self.mySwitch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.button attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
//    [self.view addConstraint:cn];
    
    
    
//#define CONSTRAINTS_IN_CODE 1
//#if CONSTRAINTS_IN_CODE
//    UIView* superview = self.view;
//    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [btn setTitle:@"Button" forState:UIControlStateNormal];
//    [superview addSubview:btn];
//    
//    
//    NSLayoutConstraint *cn = [NSLayoutConstraint constraintWithItem:btn
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:superview
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1.0
//                                                           constant:0.0];
//    [superview addConstraint:cn];
//    
//    cn = [NSLayoutConstraint constraintWithItem:btn
//                                      attribute:NSLayoutAttributeBottom
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:superview
//                                      attribute:NSLayoutAttributeBottom
//                                     multiplier:1.0
//                                       constant:-20.0f];
//    
//    [superview addConstraint:cn];
//    
//#endif
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
