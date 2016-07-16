//
//  IMSetFontSizeViewController.m
//  OuLianWang
//
//  Created by hzq on 16/7/12.
//  Copyright © 2016年 我连网. All rights reserved.
//

#import "IMSetFontSizeViewController.h"
#import "ZQMessageCell.h"
#import "IMSetUserDefaultTool.h"
@interface IMSetFontSizeViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic,strong)UITableView * exampleTableView;
@property(nonatomic,strong)UIView * bottomView;
@property(nonatomic,strong)UISlider * slider;
@property(nonatomic,strong) UITapGestureRecognizer*tapGesture;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation IMSetFontSizeViewController


-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"字体大小";
    
    [self setupView];
    [self setupDataSource];
}

-(void)setupView{
    self.exampleTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-130+64) style:UITableViewStylePlain];
    [self.view addSubview:self.exampleTableView];
    self.exampleTableView.separatorStyle =0;
    self.exampleTableView.backgroundColor = [UIColor colorWithRed:(241/255.0) green:(240/255.0)  blue:(246/255.0) alpha:1.0];;
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    
    
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-130, self.view.frame.size.width, 130)];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bottomView];
    
    [self setupSliderView];
    
    
}


-(void)setupDataSource{
    ZQMessageFrame * frame1 = [[ZQMessageFrame alloc]init];
    ZQMessage * message1 = [[ZQMessage alloc]init];
    message1.strContent = @"预览字体大小";
    message1.fromMe = 1;
    frame1.message = message1;
    [self.dataArray addObject:frame1];
    
    ZQMessageFrame * frame2 = [[ZQMessageFrame alloc]init];
    ZQMessage * message2 = [[ZQMessage alloc]init];
    message2.strContent = @"拖拽下面的滑块，可设置字体大小";
    message2.fromMe = 0;
    frame2.message = message2;
    
    [self.dataArray addObject:frame2];
    
    ZQMessageFrame * frame3 = [[ZQMessageFrame alloc]init];
    ZQMessage * message3 = [[ZQMessage alloc]init];
    message3.strContent = @"设置后，可改变聊天、菜单中的字体大小。如果在使用过程中存在问题或意见，可反馈给我连网团队";
    message3.fromMe = 0;
    frame3.message = message3;
    
    [self.dataArray addObject:frame3];
    
    
}
-(void)setupSliderView{
    
    
    
    //滑块设置
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-70, 30)];
    _slider.center = CGPointMake(self.bottomView.frame.size.width/2, self.bottomView.frame.size.height-50);
    _slider.minimumValue = 1;
    _slider.maximumValue = 6;
    _slider.minimumTrackTintColor = [UIColor clearColor];
    _slider.maximumTrackTintColor = [UIColor clearColor];
    _slider.multipleTouchEnabled = NO;
    [_slider setValue:[IMSetUserDefaultTool getFontSizeCoefficient]];
    
    
    
    //背景图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-70-30, 8)];
    imageView.center = _slider.center;
    UIImage *img = [UIImage imageNamed:@"woxin_setFontSize_line"];
    imageView.image = img;
    
    //添加点击手势和滑块滑动事件响应
    [_slider addTarget:self
                action:@selector(valueChanged:)
      forControlEvents:UIControlEventValueChanged];
    [_slider addTarget:self
                action:@selector(sliderTouchDown:)
      forControlEvents:UIControlEventTouchDown];
    [_slider addTarget:self
                action:@selector(sliderTouchUp:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [self.bottomView addSubview:imageView];
    [self.bottomView addSubview:_slider];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    _tapGesture.delegate = self;
    [_slider addGestureRecognizer:_tapGesture];
    
    UILabel * leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x-3, 30, 30, 20)];
    leftLabel .font = [UIFont systemFontOfSize:13];
    leftLabel .text = @"A";
    [self.bottomView addSubview:leftLabel];
    
    UILabel * standardLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width/5-12, 30, 50, 20)];
    standardLabel .font = [UIFont systemFontOfSize:15.5];
    standardLabel .text = @"标准";
    standardLabel.textColor = [UIColor grayColor];
    [self.bottomView addSubview:standardLabel];
    
    UILabel * rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width-7, 30, 30, 20)];
    rightLabel .font = [UIFont systemFontOfSize:24];
    rightLabel .text = @"A";
    [self.bottomView addSubview:rightLabel];

}

- (void)valueChanged:(UISlider *)sender
{
    //只取整数值，固定间距
    NSString *tempStr = [self numberFormat:sender.value];
    if (tempStr.floatValue ==sender.value) {
        return;
    }
    [sender setValue:tempStr.floatValue];
    [self setFontCoefficient:tempStr.integerValue];
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    //取得点击点
    CGPoint p = [sender locationInView:sender.view];
    //计算处于背景图的几分之几，并将之转换为滑块的值（1~6）
    float tempFloat = (p.x-15 ) / (_slider.frame.size.width-30) * 5 + 1;
    NSString *tempStr = [self numberFormat:tempFloat];
    //    NSLog(@"%f,%f,%@", p.x, tempFloat, tempStr);

    [_slider setValue:tempStr.floatValue];
    [self setFontCoefficient:tempStr.integerValue];
}

- (void)sliderTouchDown:(UISlider *)sender {
    _tapGesture.enabled = NO;
}

- (void)sliderTouchUp:(UISlider *)sender {
    _tapGesture.enabled = YES;
}
/**
 *  四舍五入
 *
 *  @param num 待转换数字
 *
 *  @return 转换后的数字
 */
- (NSString *)numberFormat:(float)num
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"0"];
    return [formatter stringFromNumber:[NSNumber numberWithFloat:num]];
}


-(void)setFontCoefficient:(NSInteger )coefficient{
    [IMSetUserDefaultTool setFontSizeCoefficient:coefficient];
    for (ZQMessageFrame * frame in self.dataArray) {
        frame.message.strContent = frame.message.strContent;
         [frame setMessage:frame.message];
    }
    [self.exampleTableView reloadData];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IMFONT_COEFFICIENT_CHANGE" object:nil];
}



-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (cell == nil) {
        cell = [[ZQMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    ZQMessageFrame *messageFrame = self.dataArray[indexPath.row];
     [cell setMessageFrame:messageFrame];
        [cell.btnHeadImage setImage:[UIImage imageNamed:@"wolianw_logo"] forState:0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZQMessageFrame *messageFrame = self.dataArray[indexPath.row];
    return messageFrame.cellHeight;
}
@end
