//
//  LYCTabBarController.m
//  BuyCarLYC
//http://blog.csdn.net/xn4545945/article/details/35994863
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCTabBarController.h"
#import "LYCMainViewController.h"
#import "LYCCarModelBaseVC.h"
#import "LYCOtherViewController.h"
@implementation LYCTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self createTabBarView];
}

- (void)createTabBarView
{
    CGRect frame  = self.tabBar.frame;
    
    //为了添加自定义的试图背景，首先要删除系统自带的tabBar层
    [self.tabBar removeFromSuperview];
    
    UIView *bgView = [[UIView alloc] init];
    
    bgView.frame = frame;
    
    bgView.backgroundColor = [UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:1];
    
    [self.view addSubview:bgView];
    
    for(int i = 0 ; i < 3; i ++)
    {
        UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *imageNameSel = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:imageNameSel] forState:UIControlStateSelected];
        
        CGFloat x = i * bgView.frame.size.width / 3;
        btn.frame = CGRectMake(x, 0, bgView.frame.size.width / 3, bgView.frame.size.height);
        //设置tag
        btn.tag = i ;
        
        [bgView addSubview:btn];
        
        //设置刚进入时,第一个按钮为选中状态
        if (0 == i) {
            btn.selected = YES;
            self.selectedBtn = btn;  //设置该按钮为选中的按钮
        }
        
    }
    
    LYCMainViewController *lycMainVC = [[LYCMainViewController alloc] init];
    
    UINavigationController *mainNavController = [[UINavigationController alloc] initWithRootViewController:lycMainVC];
    
    
    LYCCarModelBaseVC *lycModelVC = [[LYCCarModelBaseVC alloc] init];
    
    UINavigationController *modelNavController = [[UINavigationController alloc] initWithRootViewController:lycModelVC];
    
    LYCOtherViewController *otherVC = [[LYCOtherViewController alloc] init];
    
    UINavigationController *otherVCNavController = [[UINavigationController alloc] initWithRootViewController:otherVC];
    
    
     self.viewControllers = @[mainNavController,modelNavController,otherVCNavController];
    
 
 }

/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    //1.先将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    button.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = button;
    
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    self.selectedIndex = button.tag;

}




@end
