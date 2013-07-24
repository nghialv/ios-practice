//
//  ViewController.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GAViewController.h"

@interface GAViewController () <UIViewControllerRestoration>{
    NSInteger _myNumber;
}
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@end

@implementation GAViewController

#pragma mark - Life Cycle

- (IBAction)onClicked:(id)sender {
    NSLog(@"on clicked");
    
    //communitate with another app via URL scheme
    NSURL *myURL = [NSURL URLWithString:@"http://dennycd.me"];
    [[UIApplication sharedApplication] openURL:myURL];
    
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

/**
 References to any data being displayed (not the data itself)
 For a container view controller, references to its child view controllers
 Information about the current selection
 For view controllers with a user-configurable view, information about the current configuration of that view.
 **/
-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"GAViewController::encodeRestorableStateWithCoder");
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeInt:_myNumber forKey:@"MyNumber"];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"GAViewController::decodeRestorableStateWithCoder");
    [super decodeRestorableStateWithCoder:coder];
    _myNumber = [coder decodeIntForKey:@"MyNumber"];
}

#pragma mark - UIViewControllerRestoration

/**
 Note that this method does not try to configure the view controller’s data fields. 
 That step occurs later when the view controller’s state is decoded.
 **/
+ (UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSLog(@"GAViewController::viewControllerWithRestorationIdentifierPath");
    
    GAViewController* vc;
    
    /**
     Because the view controller was originally loaded from a storyboard,
     this method uses the UIStateRestorationViewControllerStoryboardKey key to
     get the storyboard from the archive.
     **/
    UIStoryboard* sb = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    if (sb) {

        vc = (GAViewController*)[sb instantiateViewControllerWithIdentifier:@"myGAViewController"];
        
        /*Reassigning the restoration identifier and restoration class, as in the preceding example, 
         is a good habit to adopt when creating new view controllers.*/
        vc.restorationIdentifier = [identifierComponents lastObject];
        vc.restorationClass = [GAViewController class];
    }
    return vc;
}


#pragma mark - Orientation
//-(NSUInteger)supportedInterfaceOrientations
//{
//}
//
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    
//}

@end
