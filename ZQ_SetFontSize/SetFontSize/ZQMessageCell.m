//
//  ZQMessageCell.m
//  UUChatDemoForTextVoicePicture
//
//  Created by shake on 14-8-27.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import "ZQMessageCell.h"
#import "ZQMessage.h"
#import "ZQMessageFrame.h"

#import "UIFont+IMFont.h"

#define kMaxChatImageViewWidth 200.f
#define kMaxChatImageViewHeight 300.

@interface ZQMessageCell ()
{

    
    UIView *headImageBackView;
    
}
@end

@implementation ZQMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        创建头像
        headImageBackView = [[UIView alloc]init];
        
        [self.contentView addSubview:headImageBackView];
        self.btnHeadImage = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnHeadImage.layer.masksToBounds = YES;
        [headImageBackView addSubview:self.btnHeadImage];
        
//        、聊天人名
        self.nameLbel = [[UILabel alloc] init];
        self.nameLbel.textColor = [UIColor grayColor];
        self.nameLbel.font = [UIFont imFontOfSize:12];
        [self.contentView addSubview:self.nameLbel];
        
//        创建内容
        self.btnContent = [[ZQMessageContentButton alloc]init];
        [self.contentView addSubview:self.btnContent];
        
       
        
        
    }
    return self;
}
-(void)redbtnLong{
    
}


#pragma mark - 内容及Frame设置
- (void)setMessageFrame:(ZQMessageFrame *)messageFrame{
    
    _messageFrame = messageFrame;
    ZQMessage *message = messageFrame.message;
//   设置头像
    headImageBackView.frame = messageFrame.iconF;
    self.btnHeadImage.frame = CGRectMake(2, 2, ChatIconWH-4, ChatIconWH-4);
    
//    设置名字
    self.nameLbel.frame = messageFrame.nameF;

//     我发出的消息
    if (message.fromMe == 1 )
    {
        // 是我的消息
        self.nameLbel.hidden = YES;
        self.btnContent.textView.textColor =[UIColor whiteColor];
        self.btnContent.textView.textContainerInset = UIEdgeInsetsMake(ChatContentTop, 7, ChatContentBottom, 9);
    }
    else {
        self.nameLbel.hidden = NO;
        // 不是我的消息
        self.btnContent.textView.textContainerInset = UIEdgeInsetsMake(ChatContentTop, 13, ChatContentBottom, 3);
    }
    
    // 4、设置内容
    self.btnContent.messageFrame = messageFrame;//这里设置内容的frame等
    
    
}




@end



