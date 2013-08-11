//
//  gmViewController.m
//  testGMap
//
//  Created by Denny C. Dai on 8/10/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "gmViewController.h"
#import <GoogleMaps/GoogleMaps.h>


@interface gmViewController ()
{
    GMSMapView *mapView_;

}
@end

@implementation gmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:1.285
                                                            longitude:103.848
                                                                 zoom:5];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView_;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
