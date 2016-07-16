//
//  IMSetUserDefaultTool.m
//  OuLianWang
//
//  Created by hzq on 16/7/13.
//  Copyright © 2016年 我连网. All rights reserved.
//

#import "IMSetUserDefaultTool.h"

#define USERDEFAULT [NSUserDefaults standardUserDefaults]
#define FONT_COEFFICIENT @"IMSizeFontCoefficient"

@implementation IMSetUserDefaultTool

+(void)setFontSizeCoefficient:(NSInteger )coefficient{
    [USERDEFAULT setInteger:coefficient forKey:FONT_COEFFICIENT];
}

+(NSInteger)getFontSizeCoefficient{
    
    NSInteger coefficient = [USERDEFAULT integerForKey:FONT_COEFFICIENT];
    if (coefficient==0) {//返回默认2
        return 2;
    }
    return  coefficient;
}

+(float )getScaleCoefficient{
    
    NSInteger coefficient =[IMSetUserDefaultTool getFontSizeCoefficient];
    return 0.075*(coefficient-2)+1;
}


@end
