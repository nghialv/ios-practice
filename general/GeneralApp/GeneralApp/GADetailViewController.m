//
//  GADetailViewController.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/25/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GADetailViewController.h"

@interface GADetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *txtLbl;
@end

@implementation GADetailViewController

//this effectively changes the status bar style !
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



-(void)awakeFromNib
{
    NSLog(@"GADetailViewController::awakeFromNib");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/**
 When the user navigates to a new level, two things should happen: 
 The bar title should change to the new level’s title, if appropriate.
 A back button should appear to the left of the title, and it should be labeled with the previous level’s title.

 **/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"GADetailViewController::viewDidLoad");
    
    
    self.navigationItem.title = self.title;
    
    [self.txtLbl setText:self.txt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
