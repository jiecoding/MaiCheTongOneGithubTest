//
//  ZYWSideView.m
//  ZYWQQ
//
//  Created by Devil on 16/2/23.
//  Copyright © 2016年 Devil. All rights reserved.
//http://code.cocoachina.com/view/129598

#import "ZYWSideView.h"
#import "ZYWSideTableView.h"
#import "Constants.h"
#import "FrameAutoScaleLFL.h"
#import <Masonry/Masonry.h>
#import "UIView+WLFrame.h"
#import "UIFont+LYCFontToolkit.h"
@interface ZYWSideView()<UIActionSheetDelegate>
@property(nonatomic,weak)UIView *blackView;

@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,copy)NSString *name;
@end



@implementation ZYWSideView

-(NSString *)name{
    if (_name==nil) {
        _name=@"跳转1";
    }
    
    return _name;
}

-(UIImageView *)headImage{
    if (_headImage==nil) {
        _headImage=[[UIImageView alloc]init];
    }
    return _headImage;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        NSArray *titleArray= @[@"搜索车系",@"降价行情",@"新车导购",@"车型对比"];
        NSArray *imageArray = @[@"slider_cell_seachicon",@"slider_cell_sale",@"slider_cell_newicon",@"slider_cell_pk"];

        for (int i = 0; i < 5; i++) {

            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0,i * (SCREEN_HEIGHT - 20 ) / 5, frame.size.width, (SCREEN_HEIGHT - 20 ) / 5)];
            [self addSubview:backView];
        
        if (i < 4) {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width / 2 - 40, 20, 70, 70)];
            imageV.image = [UIImage imageNamed:imageArray[i]];
            [backView addSubview:imageV];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageV.bottom, backView.width, backView.height - imageV.bottom)];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = titleArray[i];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont getAdaptiveFontWithPix:14.0f];
            [backView addSubview:label];

        }
        
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
            button.frame = CGRectMake(0,0,backView.width,SCREEN_HEIGHT /4.5+10);
            button.tag = 100 + i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [backView addSubview:button];
            if (i == 4) {
//                button.backgroundColor = [UIColor greenColor];
                [button setBackgroundImage:[UIImage imageNamed:@"slider_cell_redengine"] forState:UIControlStateNormal];
                button.imageView.contentMode = UIViewContentModeScaleToFill;
                
            }

    }
        
    //    注册通知观察者（接受通知，将记录跳转界面的值从主控制器传过来）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(zhuchuanzuo:) name:@"主传左" object:nil];
    
    
    
    }
    return  self ;
    
}
- (void)buttonClick:(UIButton *)button{
    switch (button.tag) {
        case 100:
            // 里面实现对应得button 点击方法
            break;
        case 101:
            
            break;

        case 102:
            
            break;

        case 103:
            
            break;

        case 104:
            
            break;

            
        default:
            break;
    }
}

-(void)dealloc
{
    // 移除通知观察者.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    DLog(@"移除主传左通知对象");
}
//接受从主控制器传过来的值
-(void)zhuchuanzuo:(NSNotification *)notify{
    
    self.name=notify.object;
}
//点击了头像按钮（更换头像）
-(void)changeHeaderImage{
    
    
    //    NSLog(@"acac");
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:self.name object:nil];
    
}

@end
