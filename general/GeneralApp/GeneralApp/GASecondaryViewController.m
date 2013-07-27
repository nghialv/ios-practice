//
//  GASecondaryViewController.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/26/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GASecondaryViewController.h"

@interface GASecondaryViewController ()

@end

@implementation GASecondaryViewController

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
    
    self.tabBarItem.title = self.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//this effectively changes the status bar style !
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
