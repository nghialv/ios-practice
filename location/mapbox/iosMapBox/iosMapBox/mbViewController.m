//
//  mbViewController.m
//  iosMapBox
//
//  Created by Denny C. Dai on 8/9/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "mbViewController.h"
#import <MapBox/MapBox.h>

@interface mbViewController () <RMMapViewDelegate>
@property (weak, nonatomic) IBOutlet RMMapView *mapView;
@end

@implementation mbViewController

#pragma mark - RMMapViewDelegate



#pragma mark - Life Cycle

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

@end
