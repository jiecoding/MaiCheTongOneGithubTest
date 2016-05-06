//
//  LYCFriendsHelpCarVC.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/6.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCFriendsHelpCarVC.h"
#import "ExcelView.h"

@interface LYCFriendsHelpCarVC ()<ExcelViewDataSource,ExcelViewDelegate>
{
    NSArray *_leftTitleArr;
    NSArray *_carNameArr;
}
@end

@implementation LYCFriendsHelpCarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0f green:233/255.0f blue:235/255.0f alpha:1];

    _leftTitleArr = [[NSArray alloc] initWithObjects:@"车型名称",@"年代款",@"厂商指导价",@"全国经销商最低价",@"实测100－0制动",@"官方0-100加速(s)",@"实测油耗(L)",@"最高车速(km/h)",@"工信部综合油耗(L)",@"排量(L)",@"车型名称",@"年代款",@"厂商指导价",@"全国经销商最低价",@"实测100－0制动",@"官方0-100加速(s)",@"实测油耗(L)",@"最高车速(km/h)",@"工信部综合油耗(L)",@"排量(L)", nil];

    
    _carNameArr = [[NSArray alloc] initWithObjects:@"宝马",@"2.0L尊贵版",@"6.0L邦德限量",@"2.0L两驱经典",@"宝马",@"2.0L尊贵版",@"6.0L邦德限量",@"2.0L两驱经典",@"宝马",@"2.0L尊贵版",@"6.0L邦德限量",@"2.0L两驱经典",@"宝马",@"2.0L尊贵版",@"6.0L邦德限量",@"2.0L两驱经典",@"宝马",@"2.0L尊贵版",@"6.0L邦德限量",@"2.0L两驱经典",@"宝马",@"2.0L尊贵版", nil];
    
    ExcelView* excel = [[ExcelView alloc] initWithFrame:CGRectMake(10, 64, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-20)];
    excel.topHeight = 130;
    excel.contentHeight= 50;
    excel.delegate = self;
    excel.dataSource = self;
    excel.leftWidth = 100;

    [self.view addSubview:excel];
    
    
    UIImageView *bang = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 110, 129)];
    bang.image = [UIImage imageNamed:@"bangxuan"];
    [self.view addSubview:bang];
    bang.layer.cornerRadius = 0.5;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 80, 20)];
    label.text = @"朋友帮选车";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    [bang addSubview:label];
}


- (NSString*)topCollectionView:(TopCollectionView*)topCollectionView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return _carNameArr[indexPath.row];
}

- (NSString*)leftTableView:(LeftTableView*)leftTableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return [_leftTitleArr objectAtIndex:indexPath.row];
}

- (NSInteger)contentTableView:(ContentTableView*)contentTableView numberOfRowsInSection:(NSInteger)section{
    return _leftTitleArr.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
