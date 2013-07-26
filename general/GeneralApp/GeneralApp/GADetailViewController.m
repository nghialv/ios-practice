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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"GADetailViewController::viewDidLoad");
    
    
    [self.txtLbl setText:self.txt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
