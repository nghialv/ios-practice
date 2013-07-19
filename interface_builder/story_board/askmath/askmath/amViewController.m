//
//  amViewController.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-29.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "amViewController.h"

@interface amViewController ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIButton *homeBtn;
@property (strong, nonatomic) IBOutlet UIButton *formulasBtn;
@property (strong, nonatomic) IBOutlet UIButton *stockBtn;
@end

@implementation amViewController


-(void)showController:(UIViewController<amViewControllerChildProtocol>*)child
{
    NSLog(@"showController");

    //if an existing child is in display, remove it from the view hierarchy
    if(self.currentController!=nil){
        [self.currentController willMoveToParentViewController:nil];
        [self.currentController.view removeFromSuperview];
        [self.currentController removeFromParentViewController];
    }

    
    //add child
    self.currentController = child;
    
    if(child){
        [self addChildViewController:self.currentController];
        
        //add the view
        [self.contentView addSubview:child.view];

        //reset the constraints in content view
        [self.contentView removeConstraints: self.contentView.constraints];
        child.view.translatesAutoresizingMaskIntoConstraints = NO;

        UIView* content = self.contentView;
        UIView* view = child.view;
        NSDictionary* views = NSDictionaryOfVariableBindings(content,view);
        [self.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view(==content)]|"
                                                                                  options:NSLayoutFormatAlignAllLeft
                                                                                  metrics:nil views:views]];
        [self.contentView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(==content)]|"
                                                                                  options:NSLayoutFormatAlignAllLeft
                                                                                  metrics:nil views:views]];
        
        //NSLog(@"%@", [dest.view constraintsAffectingLayoutForAxis:UILayoutConstraintAxisHorizontal]);
        NSAssert(! [self.contentView hasAmbiguousLayout],@"ambigous layout ");

        
        [child didMoveToParentViewController:self];
        
    }
}



//whenever a segue fired, a time to pass data to the destination view controller
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"showMainMenu"]){
        NSLog(@"showMainMenu");
    }
    else if([[segue identifier] isEqualToString:@"showFormulas"]){
        NSLog(@"showFormulas");
    }
    else if([[segue identifier] isEqualToString:@"showStockFormulas"]){
        NSLog(@"showStockFormulas");
    }
    else if([[segue identifier] isEqualToString:@"showSettings"]){
        NSLog(@"showSettings");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    //[self performSegueWithIdentifier:@"showMainMenu" sender:self];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeClicked:(id)sender {
    [self.homeBtn setSelected:YES];
    [self.stockBtn setSelected:NO];
    [self.formulasBtn setSelected:NO];
}

- (IBAction)onFormulasClicked:(id)sender {
    [self.homeBtn setSelected:NO];
    [self.stockBtn setSelected:NO];
    [self.formulasBtn setSelected:YES];
}

- (IBAction)onStockClicked:(id)sender {
    [self.homeBtn setSelected:NO];
    [self.stockBtn setSelected:YES];
    [self.formulasBtn setSelected:NO];
}

//#pragma mark - Orientation Support
//
////orientation is dtermined by Application object and the top level root controller
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//}
//
//-(BOOL)shouldAutorotate
//{
//    return YES;
//}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.currentController = nil;
    }
    return self;
}

-(void)dealloc
{
    self.currentController = nil;
}

@end






