//
//  OverviewVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/25/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "OverviewVC.h"

@interface OverviewVC ()
@property (weak, nonatomic) IBOutlet UILabel *message;

@end

@implementation OverviewVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPermUI];
}

-(void) setPermUI
{
    NSString *key = [NSString stringWithFormat:@"Overview.message"];
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
    [self.delegate setNavBar:@"Overview"];
}
@end
