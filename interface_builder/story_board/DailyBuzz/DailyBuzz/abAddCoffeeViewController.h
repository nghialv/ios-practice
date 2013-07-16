//
//  abAddCoffeeViewController.h
//  DailyBuzz
//
//  Created by Denny C. Dai on 2013-05-28.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class abAddCoffeeViewController;
@protocol abAddCoffeeViewControllerDelegate <NSObject>
-(void)abAddCoffeeViewControllerDidCancel:(abAddCoffeeViewController*)controller;
-(void)abAddCoffeeViewControllerDidFinish:(abAddCoffeeViewController*)controller;
@end

@interface abAddCoffeeViewController : UITableViewController
@property(strong, nonatomic) NSString* selectedCoffee;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property(weak, nonatomic) id<abAddCoffeeViewControllerDelegate> myDelegate;
@end
