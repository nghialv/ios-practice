//
//  abCoffeeViewController.h
//  DailyBuzz
//
//  Created by Denny C. Dai on 2013-05-28.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class abCoffeeViewController;
@protocol abCoffeeViewControllerDelegate <NSObject>
-(void)abCoffeeViewController:(abCoffeeViewController*)controller didSelectCoffee:(id)coffee;
@end

@interface abCoffeeViewController : UITableViewController
@property(weak,nonatomic) id<abCoffeeViewControllerDelegate> delegate;
@end





