//
//  amMainMenuViewController.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "amMainMenuViewController.h"
#import "amErrorHandlerViewController.h"

@interface amMainMenuViewController () <amErrorHandlerViewControllerDelegate>

@end

@implementation amMainMenuViewController

-(void)willMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"amMainMenuViewController willMoveToParentViewController");
}

-(void)didMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"amMainMenuViewController didMoveToParentViewController");
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


- (IBAction)onTestClicked:(id)sender {
    //perform a non-segue transition
    amErrorHandlerViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ErrorHandlerScene"];
    controller.modalPresentationStyle = UIModalPresentationFormSheet;
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

    
    controller.delegate = self;
    
    [self presentViewController:controller animated:YES completion:^{}];
}

-(void)amErrorHandlerViewControllerShouldDimiss:(amErrorHandlerViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}


@end
