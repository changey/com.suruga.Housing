//
//  TasksVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/25/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "TasksVC.h"

@interface TasksVC ()
@property (weak, nonatomic) IBOutlet UILabel *message;

@end

@implementation TasksVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPermUI];
}

-(void) setPermUI
{
    NSString *key = [NSString stringWithFormat:@"Tasks.message"];
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
    [self.delegate setNavBar:@"Tasks"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
