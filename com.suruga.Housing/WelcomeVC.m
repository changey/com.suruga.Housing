//
//  WelcomeVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/24/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "WelcomeVC.h"

@interface WelcomeVC ()
@property (weak, nonatomic) IBOutlet UILabel *message;

@end

@implementation WelcomeVC


- (void)viewDidLoad{
    [super viewDidLoad];
    [self setPermUI];
}

-(void) setPermUI
{
    NSString *key = [NSString stringWithFormat:@"Welcome.message"];
    self.message.text = [NSString stringWithFormat:NSLocalizedString(key,nil)];
    self.message.numberOfLines = 0;
    [self.message sizeToFit];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTempUI];
}

- (void)setTempUI
{


    [self.delegate setNavBar:@"Welcome"];
}





@end
