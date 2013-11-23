#import "AlertsController.h"

@implementation AlertsController
-(void) showAlertDueTo:(NSString *)reason{
    
    if ([reason isEqualToString:@"wrongPIN"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Alert.wrongPIN.title", nil)]
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"Alert.wrongPIN.message", nil)]
                                                       delegate:nil
                                              cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"Alert.wrongPIN.ok", nil)]
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end

