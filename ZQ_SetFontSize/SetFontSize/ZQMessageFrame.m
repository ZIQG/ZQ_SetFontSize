//
//  ZQMessageFrame.m
//  UUChatDemoForTextVoicePicture
//
//  Created by shake on 14-8-26.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import "ZQMessageFrame.h"
#import "ZQMessage.h"


@implementation ZQMessageFrame

- (void)setMessage:(ZQMessage *)message{
    
    _message = message;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    
    // 计算头像位置
    CGFloat iconX = ChatMargin;
    if (_message.fromMe == 1) {
        iconX = screenW - ChatMargin - ChatIconWH;
    }
    CGFloat iconY = CGRectGetMaxY(_timeF) + ChatMargin;
    _iconF = CGRectMake(iconX, iconY, ChatIconWH, ChatIconWH);
    
    // 3、计算名字位置
        _nameF = CGRectZero;
    
    
    // 4、计算内容位置
    CGFloat contentX = CGRectGetMaxX(_iconF)+ChatMargin/2;
    CGFloat contentY = iconY+_nameF.size.height+2;
    
    //根据种类分
    CGSize contentSize;
    
            CGSize maxSize = CGSizeMake(ChatContentW-27.5, CGFLOAT_MAX);
    contentSize = [_message.strContent boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:ChatContentFont} context:nil].size;

        if (_message.fromMe == 1)
    {
        contentX = iconX - contentSize.width - ChatContentLeft - ChatContentRight - ChatMargin;
    }
    _contentF = CGRectMake(contentX, contentY, contentSize.width + ChatContentLeft + ChatContentRight, contentSize.height + ChatContentTop + ChatContentBottom);
    
    _cellHeight = MAX(CGRectGetMaxY(self.contentF)+15, CGRectGetMaxY(self.nameF));
    
    
}



@end

