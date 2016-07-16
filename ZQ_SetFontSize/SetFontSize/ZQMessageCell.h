//
//  UUMessageCell.h
//  UUChatDemoForTextVoicePicture
//
//  Created by shake on 14-8-27.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQMessageContentButton.h"

@class ZQMessageFrame;
@class ZQMessageCell;

@interface ZQMessageCell : UITableViewCell



@property (nonatomic, strong)UILabel *nameLbel;//名字
@property (nonatomic, strong)UIButton *btnHeadImage;//头像
@property (nonatomic, strong)ZQMessageContentButton *btnContent;//显示内容
@property (nonatomic, strong)ZQMessageFrame *messageFrame;



@end

