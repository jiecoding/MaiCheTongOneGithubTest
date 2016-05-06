//
//  LYCBuyCarInfoViewModel.h
//  LaiYongChe
//
//  Created by laiyongche on 16/5/3.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYCBuyCarInfoViewModel : NSObject

@property (nonatomic,strong)NSString *pageSize;

@property (nonatomic,strong)NSString *carLevel;

@property (nonatomic,strong)NSString *cityId;

@property (nonatomic,strong)NSString *pageNo;



- (void)handleDataWithSuccess: (void (^) (NSArray * arr))success failure:(void (^) (NSError *err))failure;


@end
