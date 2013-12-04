//
//  Delegates.h
//  com.suruga.Housing
//
//  Created by yasho on 11/27/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol messageLabelDelegate <NSObject>
-(void)setNavBar:(NSString *)title;
@end



@interface Delegates : NSObject

//Notification Names
#define userIsAuthenticated @"userIsAuthenticated"
#define appStateChange @"appStateChange"
@end
