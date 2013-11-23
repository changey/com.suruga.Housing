//
//  PINVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/22/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "PINVC.h"

@interface PINVC ()
- (IBAction)changedPinTxt:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *pinTxt;
@property (weak, nonatomic) IBOutlet UILabel *explanationLbl;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;


@end

@implementation PINVC

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
	
    
    //If user clicks somewhere other than the text field, the keyboard disappears
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //Setting the title and the explanation of the PIN page.
    self.titleLbl.text = [NSString stringWithFormat:NSLocalizedString(@"PINVC.title",nils)];
    self.explanationLbl.text = [NSString stringWithFormat:NSLocalizedString(@"PINVC.explanation",nils)];
    
}

-(void)dismissKeyboard {
    [self.pinTxt resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changedPinTxt:(id)sender {
    if ([self.pinTxt.text isEqualToString:@"963369"]){
        [self.appProgressDlgt completedAppStage:@"PIN"];
    } else if (self.pinTxt.text.length > 5){
        [self.alertDlgt showAlertDueTo:@"wrongPIN"];
    }
}
@end
