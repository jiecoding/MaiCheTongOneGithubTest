//
//  LYCOtherViewController.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/4.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCOtherViewController.h"
#import "UIView+WLFrame.h"
#define StaticCell2  @"CollectionViewCell2"
#import "Constants.h"
#import "UIFont+LYCFontToolkit.h"

#import "LYCFriendsHelpCarVC.h"
@interface LYCOtherViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_cellIconArrs;
    NSMutableArray *_cellTitleArrs;
    
}
@property (retain, nonatomic) UICollectionView *collectionView;
@end

@implementation LYCOtherViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [UIColor magentaColor];
    
    self.title = @"其他";
    [self createCollectionView];
    
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0f green:233/255.0f blue:235/255.0f alpha:1];
    
    _cellIconArrs =[[NSMutableArray alloc] initWithObjects:@"FriendLookUp",@"CalculatorIcon",@"AskPrice",@"YaoHaoIcon",@"Nearby4S",@"Other_PK_Icon",@"SetIcon", nil];
    
    _cellTitleArrs =[[NSMutableArray alloc] initWithObjects:@"朋友帮选车",@"购车计算器",@"询最低价",@"摇号查询",@"附近4s店",@"车型对比",@"设置", nil];
    
    
    
}

- (UIEdgeInsets)sectionInset
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)createCollectionView
{
    if(_collectionView == nil){
        //        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        //        flowLayout.minimumInteritemSpacing = 0;
        //        flowLayout.itemSize = CGSizeMake(150, 150);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:[self setCollectionViewFlowLayout]];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:StaticCell2];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
         /*
         UIScrollView和UICollectionView默认情况下alwaysBounceVertical和alwaysBounceHorizontal都是NO；只有当内容视图的尺寸超过了自己的bounds的尺寸的时候，相应方向上反弹属性才会自动设置为YES；
         
         */
        _collectionView.alwaysBounceVertical = YES;
        [self.view addSubview:_collectionView];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}


//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 2;
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:StaticCell2 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.width / 2 -30,cell.height /2 -60, 60, 60)];
   
    UILabel *iconTitle = [[UILabel alloc]initWithFrame:CGRectMake(cell.width / 2 -40, cell.height /2, 80, 20)];
    
    iconTitle.font = [UIFont getAdaptiveFontWithPix:12.0f];
    iconTitle.text = _cellTitleArrs[indexPath.row];
    iconTitle.textAlignment = NSTextAlignmentCenter;
    //    iconImageView.backgroundColor = [UIColor redColor];
    iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_cellIconArrs[indexPath.row]]];
    [cell.contentView addSubview:iconTitle];
    [cell addSubview:iconImageView];
    cell.layer.borderWidth = 0.5;
    cell.layer.borderColor  =[UIColor lightGrayColor].CGColor;
    return cell;
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
//}
//选择一个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor greenColor]];
    
    LYCFriendsHelpCarVC *friendVC = [[LYCFriendsHelpCarVC alloc] init];
    
    [self.navigationController pushViewController:friendVC animated:YES];
}

//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor redColor]];
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(IS_IPHONE_5)
//    {
//        return CGSizeMake(80,80);
//
//    }
//    else
//    {
//        return CGSizeMake(140,140);
//
//    }

//}


- (UICollectionViewFlowLayout *)setCollectionViewFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //iphone5 100
    //iphone6 118
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width /3, [UIScreen mainScreen].bounds.size.width /3);
    
    layout.footerReferenceSize  = CGSizeMake(0, 0);
    
    layout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing      = 0.0;
    
    return layout;
    
    
    //http://www.itstrike.cn/Question/f6047cf6-2da0-4b4a-94ba-ff8ac5d6ca33.html
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
