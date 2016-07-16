//
//  UUMessageFrame.h
//  UUChatDemoForTextVoicePicture
//
//  Created by shake on 14-8-26.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//
#import "IMSetUserDefaultTool.h"
#import "UIFont+IMFont.h"
#define ChatMargin 7       //间隔
#define ChatIconWH 42       //头像宽高height、width
#define ChatPicW ([UIScreen mainScreen].bounds.size.width)*0.373       //图片宽
#define ChatPicH ([UIScreen mainScreen].bounds.size.height)*0.16 //图片高


#define ChatContentW 210    //内容宽度

#define ChatTimeMarginW 15  //时间文本与边框间隔宽度方向
#define ChatTimeMarginH 10  //时间文本与边框间隔高度方向

#define ChatContentTop 9   //文本内容与按钮上边缘间隔
#define ChatContentLeft 22  //文本内容与按钮左边缘间隔
#define ChatContentBottom 9 //文本内容与按钮下边缘间隔
#define ChatContentRight 7.5 //文本内容与按钮右边缘间隔

#define ChatTimeFont [UIFont imFontOfSize:13]   //时间字体
#define ChatContentFont [UIFont imFontOfSize:16]//内容字体
#define ChatNameFont [UIFont imFontOfSize:12]

#import <Foundation/Foundation.h>
@class ZQMessage;

@interface ZQMessageFrame : NSObject

@property (nonatomic, assign, readonly) CGRect nameF;//名字frame
@property (nonatomic, assign, readonly) CGRect iconF;//头像frame
@property (nonatomic, assign, readonly) CGRect timeF;//时间frame
@property (nonatomic, assign) CGRect contentF;//内容frame

@property (nonatomic, assign) CGFloat cellHeight;//cell 的高度

@property (nonatomic, strong) ZQMessage *message;

@end
