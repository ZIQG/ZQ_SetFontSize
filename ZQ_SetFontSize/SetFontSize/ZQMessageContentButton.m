//
//  ZQMessageContentButton.m
//  BloodSugarForDoc
//
//  Created by shake on 14-8-27.
//  Copyright (c) 2014年 shake. All rights reserved.
//

#import "ZQMessageContentButton.h"

#define HMLinkBackgroundTag 10000

#define kMaxChatImageViewWidth 200.f
#define kMaxChatImageViewHeight 300.f

@interface ZQMessageContentButton()
{
    NSTimer * _timer;
    int touchtime ;
}
@property (nonatomic, strong) NSMutableArray *links;

@end

@implementation ZQMessageContentButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self createTextView];

        

       }
    return self;
}

#pragma mark -文本视图
-(void)createTextView{
    UITextView *textView = [[UITextView alloc] init];
    // 不能编辑
    textView.editable = NO;
    // 不能滚动
    textView.scrollEnabled = NO;
    textView.userInteractionEnabled=NO;
    textView.backgroundColor = [UIColor clearColor];
    [self addSubview:textView];
    textView.font = ChatContentFont;
    self.textView = textView;
    
}

-(void)setMessageFrame:(ZQMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    self.frame = messageFrame.contentF;
        //背景气泡图
    UIImage *normal;
    ZQMessage * message = messageFrame.message;
    if (message.fromMe == 1) {
        normal = [UIImage imageNamed:@"woxin_chatRight_bg"];
        normal =  [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.9];
    }
    else{
        normal = [UIImage imageNamed:@"woxin_chatLeft_bg"];
        normal =  [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.9];
    }
    
    [self setBackgroundImage:normal forState:UIControlStateNormal];
 
    self.textView.frame = self.bounds;
    self.textView.hidden = NO;
    self.textView.text = message.strContent;
    self.textView.font = ChatContentFont;
    
}
- (void)makeMaskView:(UIView *)view withImage:(UIImage *)image
{
    UIImageView *imageViewMask = [[UIImageView alloc] initWithImage:image];
    imageViewMask.frame = CGRectInset(view.frame, 0.0f, 0.0f);
    view.layer.mask = imageViewMask.layer;
}


- (BOOL)canBecomeFirstResponder{
    return YES;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    
    
}





@end
