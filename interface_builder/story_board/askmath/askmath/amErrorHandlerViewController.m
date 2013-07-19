//
//  amErrorHandlerViewController.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "amErrorHandlerViewController.h"

@interface amErrorHandlerViewController ()
- (IBAction)onDismissClicked:(id)sender;

@end

@implementation amErrorHandlerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"amErrorHandlerViewController viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDismissClicked:(id)sender {
    if(self.delegate)
        [self.delegate amErrorHandlerViewControllerShouldDimiss:self];
}
@end
