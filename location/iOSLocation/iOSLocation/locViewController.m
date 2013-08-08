//
//  locViewController.m
//  iOSLocation
//
//  Created by Denny C. Dai on 8/8/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "locViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface locViewController()<CLLocationManagerDelegate>
{
    CLLocationManager* _locManager;
    CLGeocoder* _geocoder;
}
@property (weak, nonatomic) IBOutlet UILabel *infoLbl;
@end

@interface locViewController ()

@end

@implementation locViewController

/**
 ote: The same CLGeocoder object can be used to initiate any number of geocoding requests but only one request at a time may be active for a given geocoder.
 **/
- (IBAction)onGeocodingClicked:(id)sender {
    if(!_geocoder){
        _geocoder = [[CLGeocoder alloc] init];
    }
    
    if(_locManager.location){
        NSLog(@"initiating reverse geocoding");
        [_geocoder reverseGeocodeLocation:_locManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"%@", placemarks);
        }];
    }

}
- (IBAction)onReverseCodingClicked:(id)sender {
    if(!_geocoder){
        _geocoder = [[CLGeocoder alloc] init];
    }
    
    [_geocoder geocodeAddressString:@"1 Infinite Loop"
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     NSLog(@"%@", placemarks);
                 }];
}

#pragma mark - Direction Related Stuff
/**
 Core Location supports two different ways to get direction-related information:
 
 Devices with a magnetometer can report the direction in which a device is pointing, also known as its heading.
    * The heading of a device reflects the actual orientation of the device relative to true north or magnetic north.
 
 Devices with GPS hardware can report the direction in which a device is moving, also known as its course.
    * The course of the device represents the direction of travel and does not take into account the device orientation
 **/

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    if (newHeading.headingAccuracy < 0)
        return;
    
    // Use the true heading if it is valid.
    CLLocationDirection  theHeading = ((newHeading.trueHeading > 0) ?
                                       newHeading.trueHeading : newHeading.magneticHeading);
    
    NSLog(@"current heading %f", theHeading);
}



#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"locationManager:didChangeAuthorizationStatus %d", status);
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    // If it's a relatively recent event, turn off updates to save power
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    }
    
}

#pragma mark - Utility

//Defining a Region to Be Monitored
- (BOOL)registerMonitorRegion{
//    // Do not create regions if support is unavailable or disabled
//    if ( ![CLLocationManager regionMonitoringAvailable])
//        return NO;
    
    // Check the authorization status
    if (([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized) &&
        ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusNotDetermined))
        return NO;
    
    // Clear out any old regions to prevent buildup.
    if ([_locManager.monitoredRegions count] > 0) {
        for (id obj in _locManager.monitoredRegions)
            [_locManager stopMonitoringForRegion:obj];
    }
    
    // If the overlay's radius is too large, registration fails automatically,
    // so clamp the radius to the max value.
//    CLLocationDegrees radius = _locManager.maximumRegionMonitoringDistance;
    
    // Create the region to be monitored.
    CLRegion* region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(19.22334, -123.21124)
                                                         radius:1000
                                                     identifier:@"uniqueregionidentifier"];
    
    /**
     However, do not expect to receive an event right away. Only boundary crossings generate an event. Thus, if at registration time the user’s location is already inside the region, the location manager does not generate an event. Instead, you must wait for the user to cross the region boundary before an event is generated and sent to the delegate.
     
     **/
    [_locManager startMonitoringForRegion:region];
    return YES;
}

//handling boundary crossing event
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"didEnterRegion");
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"didExitRegion");
}

#pragma mark - Life Cycle

-(void)awakeFromNib
{
    [super awakeFromNib];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    if(!_locManager){
        _locManager = [[CLLocationManager alloc] init];
    }
    
    _locManager.delegate = self;
    _locManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locManager.distanceFilter = 500;
    
    
    
    //regular location service
    [_locManager startUpdatingLocation];
    
    
    //This service offers a significant power savings and provides accuracy that is good enough for most apps. It uses the device’s cellular radio to determine the user’s location and report changes in that location, allowing the system to manage power usage much more aggressively than it could otherwise. This service is also capable of waking up an app that is currently suspended or not running in order to deliver new location data.
    
    //If you leave this service running and your app is subsequently suspended or terminated, the service automatically wakes up your app when new location data arrives. At wake-up time, your app is put into the background and given a small amount of time to process the location data. Because your app is in the background, it should do minimal work and avoid any tasks (such as querying the network) that might prevent it from returning before the allocated time expires
    
    //[self registerMonitorRegion];
    
    
    //Getting Location Events in the Background
    // The preferred option is to use the significant location change service to wake your app at appropriate times to handle new events.
    
    //However, if your app needs to use the standard location service, you can declare your app as needing background location services.
    
    //An app should request background location services only if the absence of those services would impair its ability to operate. In addition, any app that requests background location services should use those services to provide a tangible benefit to the user. For example, a turn-by-turn navigation app would be a likely candidate for background location services because of its need to track the user’s position and report when it is time to make the next turn.
    
    
    //[_locManager startMonitoringSignificantLocationChanges];
    
    
    // Start heading updates.
    if ([CLLocationManager headingAvailable]) {
        _locManager.headingFilter = 5;
        [_locManager startUpdatingHeading];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    _locManager.delegate = nil;
    
    [_locManager stopMonitoringSignificantLocationChanges];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
