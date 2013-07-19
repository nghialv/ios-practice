//
//  amSplitViewController.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "amSplitViewController.h"

@interface amSplitViewController ()

@end

@implementation amSplitViewController

-(void)willMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"amSplitViewController willMoveToParentViewController");
}


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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
