//
//  ViewController.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GAViewController.h"

@interface GAViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@end

@implementation GAViewController
- (IBAction)onClicked:(id)sender {
    NSLog(@"on clicked");
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


-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"GAViewController::encodeRestorableStateWithCoder");
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"GAViewController::encodeRestorableStateWithCoder");
}

@end
