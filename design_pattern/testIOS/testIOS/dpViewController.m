//
//  dpViewController.m
//  testIOS
//
//  Created by Denny C. Dai on 8/14/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "dpViewController.h"

@interface dpViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testBtn; //this is the control
@end

@implementation dpViewController
- (IBAction)onButtonClicked:(id)sender {
    
    NSLog(@"button touched");
    
}

/**
 You set up a control so that it sends an action message to a target object by associating both target and action with one or more control events. To do this, send addTarget:action:forControlEvents: to the control for each target-action pair you want to specify. When the user touches the control in a designated fashion, the control forwards the action message to the global UIApplication object in a sendAction:to:from:forEvent: message.
 **/
-(void)viewDidAppear:(BOOL)animated
{
    //associate control event with a target action pair. Here view controller is the target
    //the selector is the message , and touch event is used
    [self.testBtn addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //manually send a ui event to a target
    [self.testBtn sendAction:@selector(onButtonClicked:) to:self forEvent: nil ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
