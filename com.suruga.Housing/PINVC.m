//
//  PINVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/25/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "PINVC.h"

@interface PINVC ()
- (IBAction)enterApp:(id)sender;
- (IBAction)pinChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *directions;
@property (weak, nonatomic) IBOutlet UIImageView *checkImage;
@property (weak, nonatomic) IBOutlet UITextField *pinText;

@end

@implementation PINVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (IBAction)enterApp:(id)sender {
}

- (IBAction)pinChanged:(id)sender {
}
@end
