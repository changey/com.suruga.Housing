//
//  WelcomeVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/24/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "WelcomeVC.h"

@interface WelcomeVC ()
@property (weak, nonatomic) IBOutlet UILabel *welcomeMessage;

@end

@implementation WelcomeVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI
{
    [self.delegate setLabel:self.welcomeMessage ofVC:@"Welcome"];
}





@end
