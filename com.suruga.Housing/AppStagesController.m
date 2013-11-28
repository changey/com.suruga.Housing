//
//  AppStagesController.m
//  com.suruga.Housing
//
//  Created by yasho on 11/23/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import "AppStagesController.h"

@implementation AppStagesController

+(void) completedAppStage:(NSString *)stage{
    
}

+(void)addNotificationListeners{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(correctPIN:)
                                                 name:userIsAuthenticated
                                               object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeAppState:)
                                                 name:appStateChange
                                               object:self];
}

+(void)correctPIN:(NSNotification *)notification{
    
    UIViewController * uivc = notification.object;
    [uivc dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) changeAppState:(NSNotification *)notification{
    NSString *toState = notification.object;
    
    if ([toState isEqualToString:@"toTask1"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Task1.title", nil)]
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"Task1.message", nil)]
                                                       delegate:nil
                                              cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)]
                                              otherButtonTitles:nil];
        [alert show];
    } else if ([toState isEqualToString:@"toTask2"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Task2.title", nil)]
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"Task2.message", nil)]
                                                       delegate:nil
                                              cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)]
                                              otherButtonTitles:nil];
        [alert show];
    } else if ([toState isEqualToString:@"toTask3"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Task3.title", nil)]
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"Task3.message", nil)]
                                                       delegate:nil
                                              cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)]
                                              otherButtonTitles:nil];
        [alert show];
    } else if ([toState isEqualToString:@"toTheEnd"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"TheEnd.title", nil)]
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"TheEnd.message", nil)]
                                                       delegate:nil
                                              cancelButtonTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)]
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
