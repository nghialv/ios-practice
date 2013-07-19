//
//  amViewControllerSegue.m
//  askmath
//
//  Created by Denny C. Dai on 2013-05-30.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "amViewControllerSegue.h"
#import "amViewController.h"

@implementation amViewControllerSegue

-(id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    self = [super initWithIdentifier:identifier source:source destination:destination];
    if(self){
        
    }
    return self;
}


/**
 note that the seque should only be responsble for setting up the ui layouts
 without touching any content / model stuff
 **/
-(void)perform
{
    //go from source which is the parent view controller amViewController
    amViewController* src = self.sourceViewController;
    
    //towards destination controller
    UIViewController<amViewControllerChildProtocol>* dest = self.destinationViewController;
    
    //invoke a parent view controller's support method to show the controller 
    [src showController:dest];
}

@end
