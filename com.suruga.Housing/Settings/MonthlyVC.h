//
//  MonthlyVCViewController.h
//  com.suruga.houseSelect
//
//  Created by yasho on 10/8/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthlyVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *monthlyBudgetTxt;
@property (strong) NSManagedObject *user;
@property BOOL *verbose;
@end
