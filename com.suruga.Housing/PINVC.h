//
//  PINVC.h
//  com.suruga.Housing
//
//  Created by yasho on 11/22/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PINVC;
@protocol alertDelegate <NSObject>
-(void) showAlertDueTo:(NSString *)reason;
@end

@protocol appProgressDelegate <NSObject>
-(void) completedAppStage:(NSString *)stage;
@end

@interface PINVC : UIViewController
@property (nonatomic,weak) id<alertDelegate>alertDlgt;
@property (nonatomic, weak) id<appProgressDelegate>appProgressDlgt;
@end
