//
//  LYCCanBuyViewController.h
//  LaiYongChe
//
//  Created by laiyongche on 16/5/3.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCBuyCarInfoViewModel.h"
#import "LYCBuyCarListModel.h"
#import <MBProgressHUD/MBProgressHUD.h>

#import "MJRefresh.h"


@interface LYCCanBuyViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MBProgressHUDDelegate>

{
    NSMutableArray *_seriesListArr;
    LYCBuyCarListModel *_buyCarModel;
    MBProgressHUD *MBProgHUD;

    MJRefreshGifHeader *_header;
    MJRefreshAutoGifFooter *_moreFooter;
    
    int _pageNo; //页数
    
}
@property (retain, nonatomic) UICollectionView *collectionView;

@property int carLevel;//暂时用于测试 标示vc

@end
