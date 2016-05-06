//
//  ViewController.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/1.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCMainViewController.h"
#import "UIFont+LYCFontToolkit.h"
#import "WJSegmentMenuVc.h"

#import "LYCCanBuyViewController.h"
#import "LYCTightViewController.h"
#import "LYCHomeSVUViewController.h"


#import "Constants.h"
@interface LYCMainViewController ()
{
    
}
@end

@implementation LYCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
   
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNavigation];
    
    [self createSegmentMenuHVC];

}

- (void)createNavigation
{
    UIImageView *navBgImageView = [[UIImageView alloc] init];
    
    navBgImageView.frame = CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height / 4);
    
    navBgImageView.image = [UIImage imageNamed:@"NavigationBg"];
    
    [self.view addSubview:navBgImageView];
    
    UILabel *navTitle = [[UILabel alloc] init];
    
    navTitle.frame = CGRectMake(navBgImageView.center.x -40,navBgImageView.center.y - 30, 100, 40);
    
    navTitle.text = @"买车通Test";
    
    navTitle.font = [UIFont getAdaptiveFontWithPix:20];
    
    navTitle.textColor = [UIColor whiteColor];
    
//    navTitle.backgroundColor = [UIColor blueColor];
    
    [navBgImageView addSubview:navTitle];
    
    
  
    //待优化 [
    UILabel *label = [[UILabel alloc] init];
    CGFloat ff = self.view.frame.size.height / 4 ;
    label.frame = CGRectMake(0, 0, 0, ff);
    //待优化 ]
    
  
    
    //添加右上角历史时间按钮
    UIButton *historyTimeBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    
    historyTimeBtn.frame =CGRectMake(SCREEN_WIDTH - 100,label.center.y -60, 100, 100);
    
    [historyTimeBtn addTarget:self action:@selector(didHistoryEvent) forControlEvents:UIControlEventTouchUpInside];
    
    [historyTimeBtn setImage:[UIImage imageNamed:@"chexun_historyicon_white"] forState:UIControlStateNormal];
    
    [self.view addSubview:historyTimeBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"hideSliderTapBtn"object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"showSliderTapBtn"object:nil];

}


- (void)didHistoryEvent
{
    DLog(@"didHistoryEvent");
}

- (void)createSegmentMenuHVC
{
    /* 创建WJSegmentMenuVc */
    WJSegmentMenuVc *segmentMenuVc = [[WJSegmentMenuVc alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, 40)];
    [self.view addSubview:segmentMenuVc];
    
    /* 自定义设置(可不设置为默认值) */
    segmentMenuVc.backgroundColor = [UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:1];
    segmentMenuVc.titleFont = [UIFont systemFontOfSize:13];
    segmentMenuVc.unlSelectedColor = [UIColor lightGrayColor];
    segmentMenuVc.selectedColor = [UIColor colorWithRed:230/255.0f green:185/255.0f blue:44/255.0f alpha:1];
    segmentMenuVc.MenuVcSlideType = WJSegmentMenuVcSlideTypeSlide;
    segmentMenuVc.SlideColor = [UIColor greenColor];
    segmentMenuVc.advanceLoadNextVc = YES;
    
    /* 创建测试数据 */
   
    LYCCanBuyViewController  *canBuyVC = [[LYCCanBuyViewController alloc]init];
    //每个vc数据根据carLevel来区分不同
    canBuyVC.carLevel = 1;
    LYCCanBuyViewController  *canBuyVC2 = [[LYCCanBuyViewController alloc]init];
    canBuyVC2.carLevel = 2;
    LYCCanBuyViewController  *canBuyVC3 = [[LYCCanBuyViewController alloc]init];
    canBuyVC3.carLevel = 3;

    LYCCanBuyViewController  *canBuyVC4 = [[LYCCanBuyViewController alloc]init];
    canBuyVC4.carLevel = 4;
    
    LYCCanBuyViewController  *canBuyVC5 = [[LYCCanBuyViewController alloc]init];
    canBuyVC5.carLevel = 5;
    
    LYCCanBuyViewController  *canBuyVC6 = [[LYCCanBuyViewController alloc]init];
    canBuyVC6.carLevel = 6;
    
    LYCCanBuyViewController  *canBuyVC7 = [[LYCCanBuyViewController alloc]init];
    canBuyVC7.carLevel = 7;
    
    LYCCanBuyViewController  *canBuyVC8 = [[LYCCanBuyViewController alloc]init];
    canBuyVC8.carLevel = 8;
    
//    LYCTightViewController  *tightVC =  [[LYCTightViewController alloc] init];
//    
//    LYCHomeSVUViewController  *SVUVC =  [[LYCHomeSVUViewController alloc] init];
    canBuyVC.view.backgroundColor = [UIColor clearColor];
    
    NSArray *vcArr = @[canBuyVC,canBuyVC2,canBuyVC3,canBuyVC4,canBuyVC5,canBuyVC6,canBuyVC7,canBuyVC8];
    //对应
    NSArray *titles = @[@"值得买",@"紧凑型车",@"SUV",@"中型车",@"专车",@"代驾",@"试驾",@"其他"];
//    NSArray *titles = @[@"值得买",@"紧凑型车",@"SUV"];

    /* 导入数据 */
    [segmentMenuVc addSubVc:vcArr subTitles:titles];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
