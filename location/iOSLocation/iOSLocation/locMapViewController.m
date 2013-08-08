//
//  locMapViewController.m
//  iOSLocation
//
//  Created by Denny C. Dai on 8/8/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "locMapViewController.h"
#import <MapKit/MapKit.h>

@interface locMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation locMapViewController

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
