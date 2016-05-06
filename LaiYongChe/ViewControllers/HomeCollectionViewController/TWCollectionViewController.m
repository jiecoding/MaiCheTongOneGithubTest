//
//  TWCollectionViewController.m
//  CollectionView
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 tang. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "TWCollectionViewController.h"
#import "Constants.h"
#define StaticCell  @"CollectionViewCell"

#import "LYCBuyCarInfoViewModel.h"
#import "LYCBuyCarListModel.h"

#import "UIView+WLFrame.h"
#import "UIFont+LYCFontToolkit.h"
@interface TWCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_seriesListArr;
    LYCBuyCarListModel *_buyCarModel;
}
@property (retain, nonatomic) UICollectionView *collectionView;

@end

@implementation TWCollectionViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _seriesListArr = [NSMutableArray array];
        _buyCarModel = [[LYCBuyCarListModel alloc] init];
        [self createCollectionView];
        //数据处理
        [self dataAccess];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)dataAccess
{
    LYCBuyCarInfoViewModel *buyCarViewModel = [[LYCBuyCarInfoViewModel alloc] init];
    
    [buyCarViewModel handleDataWithSuccess:^(NSArray *arr) {
        [_seriesListArr removeAllObjects];
        [_seriesListArr addObjectsFromArray:arr];
        [_collectionView reloadData];
        //数组里存的是buycarlistmodel
        //        DLog(@"buyCarViewModel success%@",arr);
    } failure:^(NSError *err) {
        DLog(@"buy CarViewModel failure %@",err);
    }];
    
}

- (void)createCollectionView
{
    if(_collectionView == nil){
        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:StaticCell];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        /*
         UIScrollView和UICollectionView默认情况下alwaysBounceVertical和alwaysBounceHorizontal都是NO；只有当内容视图的尺寸超过了自己的bounds的尺寸的时候，相应方向上反弹属性才会自动设置为YES；
         
         */
        _collectionView.alwaysBounceVertical = YES;
        [self addSubview:_collectionView];
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
    
    UILabel *carName = [[UILabel alloc]initWithFrame:CGRectMake(cell.width/2 - 30,cell.height / 2 + 20 , 120, 20)];
    
    carName.text = _buyCarModel.name;
    
    carName.font = [UIFont getAdaptiveFontWithPix:13.0f];
    
//    cell.contentView.backgroundColor = [UIColor clearColor];
    //
//    cell.backgroundColor = [UIColor clearColor];
//    
//    
//    carImageView.backgroundColor = [UIColor redColor];

    
    [cell.contentView addSubview:carImageView];
    
    [cell.contentView addSubview:carName];
    
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
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}

//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
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

@end
