//
//  WelcomeVC.h
//  com.suruga.Housing
//
//  Created by yasho on 11/24/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol messageLabelDelegate <NSObject>
-(void)setLabel:(UILabel *)label ofVC:(NSString *)vc;

@end
@interface WelcomeVC : UIViewController
@property (nonatomic,weak) id<messageLabelDelegate>delegate;
@end
