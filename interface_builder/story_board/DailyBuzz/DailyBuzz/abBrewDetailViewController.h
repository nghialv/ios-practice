//
//  abBrewDetailViewController.h
//  DailyBuzz
//
//  Created by Denny C. Dai on 2013-05-28.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface abBrewDetailViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *coffeeName;
@property (strong, nonatomic) IBOutlet UILabel *temperature;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property(strong,nonatomic) NSString* data;
@end
