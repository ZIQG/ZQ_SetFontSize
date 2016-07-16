//
//  UUMessageContentButton.h
//  BloodSugarForDoc
//
//  Created by shake on 14-8-27.
//  Copyright (c) 2014年 shake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQMessageFrame.h"
#import "ZQMessage.h"

@interface ZQMessageContentButton : UIButton

@property (nonatomic, weak) UITextView *textView;

@property (nonatomic, strong) ZQMessageFrame *messageFrame;

@end
