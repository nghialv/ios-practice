//
//  ViewController.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GAViewController.h"
#import "GADetailViewController.h"

@interface GAViewController () <UIViewControllerRestoration>{
    NSInteger _myNumber;
}
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@end

@implementation GAViewController

#pragma mark - Transition
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showDetail"]){
        NSLog(@"pass in some detail");
        GADetailViewController* controller = (GADetailViewController*)segue.destinationViewController;
        NSAssert([controller isKindOfClass:[GADetailViewController class]], @"invalid class");
        controller.txt = @"Hello World"; //don't attemp to access its ui cuz it may not be loaded yet 
    }
}

#pragma mark - Life Cycle

- (IBAction)onClicked:(id)sender {
    NSLog(@"on clicked");
    
//    //communitate with another app via URL scheme
//    NSURL *myURL = [NSURL URLWithString:@"http://dennycd.me"];
//    [[UIApplication sharedApplication] openURL:myURL];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = self.title;
    
    /**
     In iOS 6, tintColor tinted the background of navigation bars, tab bars, toolbars, search bars, and scope bars. To tint a bar background in iOS 7, use the barTintColor property instead.
     **/
    
    //[self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
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
