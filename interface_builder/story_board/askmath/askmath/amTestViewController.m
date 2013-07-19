//
//  amTestViewController.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-30.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "amTestViewController.h"

@interface amTestViewController ()
@property (strong, nonatomic) IBOutlet UIView *testView;

@end

#pragma mark - 

@implementation amTestViewController

/**
 The area each view controller fills is determined by its parent. The root view controller’s area is determined by the window. In Figure 1-11, the tab view controller gets its size from the window. It reserves space for its tab bar and gives the remainder of the space to its children. If the navigation controller were the control displayed right now, it reserves space for its navigation bar and hands the rest to its content controller. At each step, the child view controller’s view is resized by the parent and placed into the parent’s view hierarchy.
 
 A view controller presents another view controller when it wants that view controller to perform a task.
 
 When a view controller is presented, the portion of the screen that it covers is defined by a presentation context provided to it by another view controller. The view controller that provides the presentation context does not need be the same view controller that presented it. Figure 1-14 shows the same view controller hierarchy that is presented in Figure 1-13. You can see that the content view presented the view controller, but it did not provide the presentation context. Instead, the view controller was presented by the tab controller. Because of this, even though the presenting view controller only covers the portion of the screen provided to it by the tab view controller, the presented view controller uses the entire area owned by the tab view controller.
 
 
View controllers are descendants of the UIResponder class and are therefore capable of handling all sorts of events. When a view does not respond to a given event, it passes that event to its superview, traveling up the view hierarchy all the way to the root view. However, if any view in the chain is managed by a view controller, it passes the event to the view controller object before passing it up to the superview. In this way, the view controller can respond to events that are not handled by its views. If the view controller does not handle the event, that event moves on to the view’s superview as usual.
 
 **/

//REFERNECE https://developer.apple.com/library/ios/#featuredarticles/ViewControllerPGforiPhoneOS/AdoptingaFull-ScreenLayout/AdoptingaFull-ScreenLayout.html

#pragma mark - Orientation Support

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willRotateToInterfaceOrientation");
}

//called within an animation block. so any property changes made in the method will animate at the same time as other rotation animations
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willAnimateRotationToInterfaceOrientation");
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"didRotateFromInterfaceOrientation");
}


////
////orientation is dtermined by Application object and the top level root controller
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//}
//
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//     return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//}
////
////programatically suppress rotation 
//-(BOOL)shouldAutorotate
//{
//    return YES;
//}


#pragma mark - Layout Management


-(void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews");
   NSLog(@"current UI orientation %d",[UIApplication sharedApplication].statusBarOrientation);
    NSLog(@"current physical orientation %d",[UIDevice currentDevice].orientation);
}

-(void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews");
}

-(void)updateViewConstraints
{
    NSLog(@"updateViewConstraints");
    [super updateViewConstraints];
}


#pragma mark - Resource Management Tasks

//allocate or loading data to be displayed in your view 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

-(void)awakeFromNib
{
    NSLog(@"awakeFromNib");
}

//creating your view objects here 
//-(void)loadView
//{
//    NSLog(@"loadView");
//}


//init from storyboard
//allocate critical data structures required by your view controller
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        NSLog(@"initWithCoder");
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    //if the view is not on screen, clean up
    if([self.view window] == nil){
        self.view = nil; //next time the view property is accessed, this view will be reloaded again 
    }
}

//releasing critical data structures required by your view controller 
-(void)dealloc
{
}


#pragma mark - Display Related Notification 
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%d", [self isMovingToParentViewController]); //view is being added to a parent view controller 
    NSLog(@"%d", [self isBeingPresented]); //view is being presented by another view controller
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    //if false, it means the view is disapperaed becuase another view is being displayed on top of it 
    NSLog(@"%d", [self isMovingFromParentViewController]);
    NSLog(@"%d", [self isBeingDismissed]);
}

-(void)viewDidDisappear:(BOOL)animated
{
    
}

//check why view's apperance changed 

@end
