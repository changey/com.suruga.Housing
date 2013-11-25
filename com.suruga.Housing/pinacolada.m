#import "pinacolada.h"

@interface pinacolada ()
@property (weak, nonatomic) IBOutlet UINavigationItem *navBarTitle;
@property (weak, nonatomic) IBOutlet UILabel *explanationLabel;
@property (weak, nonatomic) IBOutlet UITextField *pinText;
- (IBAction)changedPinTxt:(id)sender;
#define PIN_MAX_LENGTH 6
@end



@implementation pinacolada


# pragma mark - Initialization

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    //Dismiss keyboard upon tapping view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    //Set title & explanation of VC
    self.navBarTitle.title = [NSString stringWithFormat:NSLocalizedString(@"PINVC.title",nils)];
    self.explanationLabel.text = [NSString stringWithFormat:NSLocalizedString(@"PINVC.explanation",nils)];
    [self.explanationLabel sizeToFit];
    
    
    
}

-(void)dismissKeyboard {
    [self.pinText resignFirstResponder];
}

#pragma mark - Interaction

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > PIN_MAX_LENGTH) ? NO : YES;
}

- (IBAction)changedPinTxt:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pinTextEntered" object:self.pinText.text];
}

@end
