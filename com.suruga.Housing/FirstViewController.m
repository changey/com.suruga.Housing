//
//  FirstViewController.m
//  com.suruga.Housing
//
//  Created by yasho on 11/22/13.
//  Copyright (c) 2013 MIT. All rights reserved. 
//

#import "FirstViewController.h"
#import "InitializationVC.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self performSegueWithIdentifier:@"toInitials" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
