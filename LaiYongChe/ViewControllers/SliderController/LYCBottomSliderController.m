//
//  LYCBottomSliderController.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/28.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCBottomSliderController.h"
#import "LYCTabBarController.h"
#import "UIView+SHCZExt.h"
#import "ZYWSideView.h"
#import "Constants.h"

@interface LYCBottomSliderController ()
{
    //是否点击展开了侧滑菜单
    BOOL _isTap;
  
}
@property UISwipeGestureRecognizer *leftRecognizer;
@property UISwipeGestureRecognizer *rightRecognizer;

@end
@implementation LYCBottomSliderController
 

- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor clearColor];
    _isTap = NO;

    [self addSubViews];
    [self addRecognizer];
    
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0f green:233/255.0f blue:235/255.0f alpha:1];

}

//添加子视图
-(void)addSubViews{
    
    //在self.view上创建一个透明的View  作为leftView
    ZYWSideView *sliderLeftView=[[ZYWSideView alloc]initWithFrame:CGRectMake(-self.view.frame.size.width*0.35,0,self.view.frame.size.width*0.35,self.view.bounds.size.height)];
    
    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sliderLeftViewBg"]];
    
    img.frame=CGRectMake(-self.view.frame.size.width*0.35,0,SCREEN_WIDTH/2 -10,SCREEN_HEIGHT);
    [self.view addSubview:img];

    //添加
    [self.view addSubview:sliderLeftView];
    
    
    [self addTabbarController];
    
}

//添加主控制器（tabbarcontroller）的View

-(void)addTabbarController{
    
    LYCTabBarController *MVC = [[LYCTabBarController alloc] init];
    
    //  添加子控制器 - 保证响应者链条的正确传递
    [self addChildViewController:MVC];
    
    //  将 MVC 的视图，添加到 self.view 上
    [self.view addSubview:MVC.view];
    
    MVC.view.frame = self.view.bounds;
    
    //待优化 [
    UILabel *label = [[UILabel alloc] init];
    CGFloat ff = self.view.frame.size.height / 4 ;
    label.frame = CGRectMake(0, 0, 0, ff);
    //待优化 ]
    //添加左上角点击展开按钮
    _tapShowLeftVCbtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    _tapShowLeftVCbtn.frame =CGRectMake(0,label.center.y -60, 100, 100);
    
    [_tapShowLeftVCbtn addTarget:self action:@selector(didTapEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    [_tapShowLeftVCbtn setImage:[UIImage imageNamed:@"sliderTapBtnBg"] forState:UIControlStateNormal];
    
    [self.view addSubview:_tapShowLeftVCbtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSliderTapBtn)name:@"showSliderTapBtn"object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideSliderTapBtn)name:@"hideSliderTapBtn"object:nil];

    
}

- (void)showSliderTapBtn
{
    _tapShowLeftVCbtn.alpha = 1;
}

- (void)hideSliderTapBtn
{
    _tapShowLeftVCbtn.alpha = 0;
}


- (void)didTapEvent:(UIButton *)btn
{
    _isTap = !_isTap;
    if (_isTap) {
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(self.view.frame.size.width*0.35, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            [self.view removeGestureRecognizer:_rightRecognizer];
            [self.view addGestureRecognizer:_leftRecognizer];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            [self.view removeGestureRecognizer:_leftRecognizer];
            [self.view addGestureRecognizer:_rightRecognizer];
            
        }];
        
    }
}

//添加手势
-(void)addRecognizer{
    //  向左
    _leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didPanEvent:)];
    _leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:_leftRecognizer];
    
    _rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightPanEvent:)];
    _rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:_rightRecognizer];

     _isTap = NO;
}


//实现拖拽
-(void)didPanEvent:(UIPanGestureRecognizer *)recognizer{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:_leftRecognizer];
        [self.view addGestureRecognizer:_rightRecognizer];
    }];
    
    _isTap = YES;
}
-(void)rightPanEvent:(UIPanGestureRecognizer *)recognizer{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(self.view.frame.size.width*0.35, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        [self.view removeGestureRecognizer:_rightRecognizer];
        [self.view addGestureRecognizer:_leftRecognizer];

    }];
    
}


@end
