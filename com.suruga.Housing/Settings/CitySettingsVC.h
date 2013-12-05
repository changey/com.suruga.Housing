//
//  CitySettingsVC.h
//  com.suruga.houseSelect
//
//  Created by yasho on 9/27/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitySettingsVC : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *citiesTable;
@property (strong) NSManagedObject *user;

@end
