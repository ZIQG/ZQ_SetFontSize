//
//  UUMessage.h
//  UUChatDemoForTextVoicePicture
//  单聊消息数据结构 以及数据库的表结构
//  Created by shake on 14-8-26.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZQMessage :NSObject


@property (nonatomic, assign) BOOL fromMe; //是否自己发的
@property (nonatomic, copy) NSString *strContent;  //消息内容



@end
