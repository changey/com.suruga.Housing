//
//  PINVC.h
//  com.suruga.Housing
//
//  Created by yasho on 11/25/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegates.h"

@interface PINVC : UIViewController
@property (nonatomic,weak) id<messageLabelDelegate>delegate;
@end
