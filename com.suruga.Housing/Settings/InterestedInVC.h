//
//  InterestedInVCViewController.h
//  com.suruga.houseSelect
//
//  Created by yasho on 10/7/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InterestedInVC : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *interestedInTable;
@property (strong) NSManagedObject *user;
@end
