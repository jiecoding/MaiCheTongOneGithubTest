//
//  LYCCanBuyViewController.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/3.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCCanBuyViewController.h"
#import "TWCollectionViewController.h"
#import "Constants.h"
#define StaticCell  @"CollectionViewCell"


#import "UIImageView+WebCache.h"
#import "LYCBuyCarInfoViewModel.h"
#import "LYCBuyCarListModel.h"

#import "UIView+WLFrame.h"
#import "UIFont+LYCFontToolkit.h"


@implementation LYCCanBuyViewController

- (void)viewWillAppear:(BOOL)animated
{
    _pageNo  = 1;
    _seriesListArr = [NSMutableArray array];
    _buyCarModel = [[LYCBuyCarListModel alloc] init];
    [self createCollectionView];
    
    
    //多个静态图片链接动态图
    UIImage *image1  = [UIImage imageNamed:@"refresh1"];
    UIImage *image2  = [UIImage imageNamed:@"refresh2"];
    UIImage *image3  = [UIImage imageNamed:@"refresh3"];
    UIImage *image4  = [UIImage imageNamed:@"refresh4"];
    NSArray *idleImages = @[image1,image2,image3,image4];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    _header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 设置普通状态的动画图片
    [_header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [_header setImages:idleImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [_header setImages:idleImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.collectionView.mj_header = _header;
    
    
    _moreFooter = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [_moreFooter setImages:idleImages forState:MJRefreshStateIdle];
    [_moreFooter setImages:idleImages forState:MJRefreshStatePulling];
    [_moreFooter setImages:idleImages forState:MJRefreshStateRefreshing];
    self.collectionView.mj_footer = _moreFooter;
    
    
    //数据处理
    [self dataAccess];
    self.view.backgroundColor = [UIColor clearColor];
}

//加载更多
- (void)loadMoreData
{
    _pageNo ++;
    
    [self dataAccess];
    
    [_moreFooter endRefreshing];
}

//刷新数据
- (void)loadNewData
{
    _pageNo = 1;
    [self dataAccess];
    [_header endRefreshing];
}


- (void)dataAccess
{
    LYCBuyCarInfoViewModel *buyCarViewModel = [[LYCBuyCarInfoViewModel alloc] init];
    buyCarViewModel.cityId = @"1";
    buyCarViewModel.pageSize = @"8";
    buyCarViewModel.carLevel = [NSString stringWithFormat:@"%d",self.carLevel];
    buyCarViewModel.pageNo = [NSString stringWithFormat:@"%d",_pageNo];
    
    MBProgHUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    MBProgHUD.delegate = self;
    
    [MBProgHUD show:YES];
    [buyCarViewModel handleDataWithSuccess:^(NSArray *arr) {
        if(_pageNo == 1){
            [_seriesListArr removeAllObjects];
        }
        [_seriesListArr addObjectsFromArray:arr];
        [_collectionView reloadData];
        [MBProgHUD hide:YES ];
        //数组里存的是buycarlistmodel
        //        DLog(@"buyCarViewModel success%@",arr);
    } failure:^(NSError *err) {
        DLog(@"buy CarViewModel failure %@",err);
        [MBProgHUD hide:YES];
    }];
    
}

- (void)createCollectionView
{
    if(_collectionView == nil){
        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:StaticCell];
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
    return _seriesListArr.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:StaticCell forIndexPath:indexPath];
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView *carImageView = [[UIImageView alloc]initWithFrame:CGRectMake(cell.width/2 - 60, 0, 120, 100)];
    
    _buyCarModel = _seriesListArr[indexPath.row];
    
    
    if(_buyCarModel){
        
        NSString *urlStr = _buyCarModel.imgPath;
        
        [carImageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"buyCarImage"]];
    }
    
    UILabel *carName = [[UILabel alloc]initWithFrame:CGRectMake(cell.width/2 - 60,cell.height / 2 + 30 , 120, 20)];
    
    carName.text = _buyCarModel.name;
    carName.textAlignment = NSTextAlignmentCenter;
    carName.font = [UIFont getAdaptiveFontWithPix:13.0f];
    
    UIImageView *iconImageV = [[UIImageView alloc] initWithFrame:CGRectMake(cell.width/2 - 10, cell.height/2-5 , 30, 30)];
    
    NSString *iconUrlStr = _buyCarModel.brandLogo;

    [iconImageV sd_setImageWithURL:[NSURL URLWithString:iconUrlStr] placeholderImage:[UIImage imageNamed:@"iconCar"]];
    
    UILabel *priceRange = [[UILabel alloc] initWithFrame:CGRectMake(cell.width/2 - 50, cell.height/2 + 50, 120, 30)];
    priceRange.text = _buyCarModel.guidePrice;
    
    priceRange.font = [UIFont getAdaptiveFontWithPix:12.0f];
    [cell.contentView addSubview:priceRange];
    [cell.contentView addSubview:iconImageV];
    //    cell.contentView.backgroundColor = [UIColor clearColor];
    //
    //    cell.backgroundColor = [UIColor clearColor];
    //
    //
    //    carImageView.backgroundColor = [UIColor redColor];
    
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(cell.width/2 -20, cell.height/2+70, 120, 30)];
    
    price.text = _buyCarModel.hq;
    
//    if([price.text isEqualToString:@""])
//    {
//        price.text = @"11";
//    }
//    
    price.font = [UIFont getAdaptiveFontWithPix:14.0f];
    price.textColor = [UIColor redColor];
    [cell.contentView addSubview:carImageView];
    
    [cell.contentView addSubview:carName];
    
    [cell.contentView addSubview:price];

    //    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}
//选择一个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //    [cell setBackgroundColor:[UIColor greenColor]];
}

//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //    [cell setBackgroundColor:[UIColor redColor]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(IS_IPHONE_5)
    {
        return CGSizeMake(140, 170);
        
    }
    else
    {
        return CGSizeMake(170, 200);
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}




@end
