//
//  PINVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/25/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "PINVC.h"

@interface PINVC ()
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
- (IBAction)enterApp:(id)sender;
- (IBAction)pinChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UIImageView *checkImage;
@property (weak, nonatomic) IBOutlet UITextField *pinText;
#define PIN_MAX_LENGTH 6

@end

@implementation PINVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPermUI];
}

-(void) setPermUI
{
    NSString *key = [NSString stringWithFormat:@"PIN.message"];
    self.message.text = [NSString stringWithFormat:NSLocalizedString(key,nil)];
    self.message.numberOfLines = 0;
    [self.message sizeToFit];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard{
    [self.pinText resignFirstResponder];
}

-(void)actOnCorrectPIN{
    self.checkImage.image = [UIImage imageNamed:@"Check-128.png"];
}

-(void)actOnIncorrectPIN{
    self.checkImage.image = [UIImage imageNamed:@"Delete-128.png"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTempUI];
}

- (void)setTempUI
{
    [self.delegate setNavBar:@"Enter PIN"];
}

- (IBAction)enterApp:(id)sender {
    NSLog(@"notification is posted");
    [[NSNotificationCenter defaultCenter]
     postNotificationName:userIsAuthenticated
     object:nil];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > PIN_MAX_LENGTH) ? NO : YES;
}

- (IBAction)pinChanged:(id)sender {
    NSString *enteredPIN = self.pinText.text;
    if (enteredPIN.length>5){
        if ([enteredPIN isEqualToString:@"159357"]){
            self.checkImage.image = [UIImage imageNamed:@"Check-128.png"];
            self.pinText.enabled = NO;
            self.enterButton.userInteractionEnabled = YES;
        } else{
            self.checkImage.image = [UIImage imageNamed:@"Delete-128.png"];
        }
    } else {
        self.checkImage.image = nil;
    }
}
@end
