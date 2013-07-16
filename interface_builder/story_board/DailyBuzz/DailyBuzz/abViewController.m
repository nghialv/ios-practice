//
//  abViewController.m
//  DailyBuzz
//
//  Created by Denny C. Dai on 2013-05-28.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "abViewController.h"
#import "abMyCell.h"
#import "abBrewDetailViewController.h"
#import "abAddCoffeeViewController.h"

@interface abViewController ()<abAddCoffeeViewControllerDelegate>

@end

@implementation abViewController


-(void)done:(UIStoryboardSegue *)segue
{
    NSLog(@"done here ");
}

-(void)abAddCoffeeViewControllerDidCancel:(abAddCoffeeViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"modal view dismissed");
    }];
    
    //    [self.navigationController popToViewController:self animated:YES];
}

-(void)abAddCoffeeViewControllerDidFinish:(abAddCoffeeViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"modal view dismissed");
    }];
    
    //[self.navigationController popViewControllerAnimated:YES];
}

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


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    abMyCell* cell = [tableView dequeueReusableCellWithIdentifier:@"myCutomCell"];
    [cell.nameLbl setText:@"StarBucks"];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"showBrewDetails"]){
        abBrewDetailViewController* controller = (abBrewDetailViewController*)[segue destinationViewController];
        //pass data to the controller here
        NSIndexPath* path = [self.tableView indexPathForSelectedRow];
        controller.data = [NSString stringWithFormat:@"%d|%d", path.section, path.row];
    }
    else if([[segue identifier] isEqualToString:@"addCoffees"]){
        UINavigationController* navcontroller = [segue destinationViewController];
        abAddCoffeeViewController* controller = (abAddCoffeeViewController*)[navcontroller topViewController];
        NSAssert(controller!=nil && [controller isKindOfClass:[abAddCoffeeViewController class]],
                 @"failed to obtain abAddCoffeViewController");
        controller.myDelegate = self;
    }
}


@end
