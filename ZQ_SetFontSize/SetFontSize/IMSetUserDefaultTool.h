//
//  IMSetUserDefaultTool.h
//  OuLianWang
//
//  Created by hzq on 16/7/13.
//  Copyright © 2016年 我连网. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMSetUserDefaultTool : NSObject
//设置字体大小系数，1到6  2为默认标准
+(void)setFontSizeCoefficient:(NSInteger )coefficient;

//读取字体大小系数，1到6  2为默认标准
+(NSInteger )getFontSizeCoefficient;

//读取比例系数 (0.925~1.30)
+(float )getScaleCoefficient;
@end
