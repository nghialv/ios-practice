//
//  ViewController.m
//  iosUIDesign
//
//  Created by Denny C. Dai on 7/16/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "uiDesignMainViewController.h"

@interface uiDesignMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnClick;

@end

@implementation uiDesignMainViewController
- (IBAction)onClicked:(id)sender {
    NSLog(@"hello world");
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
