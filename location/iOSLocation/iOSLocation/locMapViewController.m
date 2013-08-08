//
//  locMapViewController.m
//  iOSLocation
//
//  Created by Denny C. Dai on 8/8/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "locMapViewController.h"
#import <MapKit/MapKit.h>

/**
  Three main coordinate system
 
 A map coordinate is a latitude and longitude on the spherical representation of the Earth.  
 
 A map point is an x and y value on the Mercator map projection.
    * Map points are used for many map-related calculations instead of map coordinates because they simplify the mathematics involved in the calculations.
    *  In your app, you use map points primarily when specifying the shape and position of custom map overlays.
 
 A point is a graphical unit associated with the coordinate system of a UIView object. Map points and map coordinates must be mapped to points before drawing custom content in a view.
 
 
 * Annotations are used to display content that can be defined by a single coordinate point. 
 * overlays are used to display content that is defined by any number of points and may constitute one or more contiguous or noncontiguous shapes.
 
 
 
 As a result, it always tries to display a corresponding annotation view when the given coordinate point is on the screen. If the coordinates for two annotations are close together, this could lead to overlap between the corresponding annotation views. And if your map includes hundreds of annotations, zooming out far enough could lead to a visually unappealing mass of annotation views. Even worse, the views may be so close together that the user cannot access some of them.
 
 
 Overlay objects are typically small data objects that store the points that define the overlay and any other relevant information, such as a title string.
 
 
 
 Managing the Map’s Annotation Objects
 If your app works with more than a few annotations, you might need to think about how you manage those objects. The map view does not make any distinction between active and inactive annotations; it considers all annotation objects it knows about to be active. As a result, it always tries to display a corresponding annotation view when the given coordinate point is on the screen. If the coordinates for two annotations are close together, this could lead to overlap between the corresponding annotation views. And if your map includes hundreds of annotations, zooming out far enough could lead to a visually unappealing mass of annotation views. Even worse, the views may be so close together that the user cannot access some of them.
 
 The only way to eliminate annotation overcrowding is to remove some of the annotation objects from the map view. This typically involves implementing the mapView:regionWillChangeAnimated: and mapView:regionDidChangeAnimated: methods to detect changes in the map zoom level. During a zoom change, you can add or remove annotations as needed based on their proximity to one another. You might also consider other criteria (such as the user’s current location) to eliminate some annotations.
 
 In iOS 4.0 and later, Map Kit includes numerous functions to make determining the proximity of map points easier. If you convert the map coordinate of your annotation to the map point coordinate space, you can use the MKMetersBetweenMapPoints method to get absolute distances between two points. You can also use each coordinate as the center of a map rectangle and use the MKMapRectIntersectsRect function to find any intersections. For a complete list of functions, see Map Kit Functions Reference.
 

 
 
 
 Managing the Map’s Overlay Objects
 If your app works with more than one overlay, you might need to think about how to manage those objects. Like annotations, the overlays associated with a map are always displayed when any portion of the overlay intersects the visible portion of the map. Unlike annotations, overlays scale proportionally with the map and therefore do not automatically overlap one another. This means, you are less likely to have to remove overlays and add them later to prevent overcrowding. In cases where the bounding rectangles of two overlays do overlap, you can either remove one of the overlays or arrange their Z-order to control which one appears on top.
 
 The overlays property of the MKMapView class stores the registered overlays in an ordered array. The order of the objects in this array matches the Z-order of the objects at render time, with the first object in the array representing the bottom of the Z-order. To place an overlay on top of all other overlays, you add it to the end of this array. You can also insert objects at different points in the array and exchange the position of two objects in the array using the map view’s methods.
 
 If you decide to implement some type of overlap-detection algorithm for overlays, one place to do so is in the mapView:didAddOverlayViews: method of your map view delegate. When this method is called, you can use the MKMapRectIntersectsRect function to see if the added overlay intersects the bounds of any other overlays. If there is an overlap, use whatever custom logic is needed to choose which one should be placed on top in the rendering tree and exchange positions as needed. (Because the map view is an interface item, any modifications to the overlays array should be synchronized and performed on the app’s main thread. The actual comparisons may occur on a different thread, though.)
 

 
 
 
 **/

@interface locMapViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation locMapViewController
- (IBAction)onDirectionClicked:(id)sender {

    MKMapItem* from = [MKMapItem mapItemForCurrentLocation];
    
    CLLocation* fromLocation = _mapView.userLocation.location;
    
    // Create a region centered on the starting point with a 10km span
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(fromLocation.coordinate, 10000, 10000);
    
    // Open the item in Maps, specifying the map region to display.
    [MKMapItem openMapsWithItems:[NSArray arrayWithObject:from]
                   launchOptions:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSValue valueWithMKCoordinate:region.center], MKLaunchOptionsMapCenterKey,
                                  [NSValue valueWithMKCoordinateSpan:region.span], MKLaunchOptionsMapSpanKey, nil]];
    
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    else
    if([annotation isKindOfClass:[MKPointAnnotation class]]){
        MKAnnotationView* annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"dummyAnnoView"];
        if (!annoView)
        {
            // If an existing pin view was not available, create one.
            annoView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"dummyAnnoView"];
            annoView.tintColor = MKPinAnnotationColorRed;
            annoView.canShowCallout = YES;
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:
                                     UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(showAnnoDetail:) forControlEvents:UIControlEventTouchUpInside];
            annoView.rightCalloutAccessoryView = rightButton;
        }
        else
            annoView.annotation = annotation;
        
        return annoView;
    }
    
    return nil;
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    NSLog(@"rendererForOverlay");
    
    if([overlay isKindOfClass:[MKCircle class]]){
        
        
        
        MKCircleRenderer* render = [[MKCircleRenderer alloc] initWithCircle:(MKCircle*)overlay];
        render.fillColor = [UIColor greenColor];
        render.alpha = 0.5;
        return render;
    }
    
    return nil;
}

#pragma mark - Life Cycle

-(void)showAnnoDetail:(id)sender
{
    NSLog(@"showAnnoDetail");
}

-(void)awakeFromNib
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(37.785834, -122.406417), 1000, 1000) animated:YES];

    //add anno
    MKPointAnnotation* anno = [[MKPointAnnotation alloc] init];
    anno.coordinate = CLLocationCoordinate2DMake(37.785634, -122.403417);
    anno.title = @"Dummy Center";
    anno.subtitle = @"this is a dummy centre";
    [self.mapView addAnnotation:anno];
    
    //add overlay
    MKCircle* overlay = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(37.785634, -122.403417) radius:250];
    overlay.title = @"Circle";
    [self.mapView addOverlay:overlay];
    
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
