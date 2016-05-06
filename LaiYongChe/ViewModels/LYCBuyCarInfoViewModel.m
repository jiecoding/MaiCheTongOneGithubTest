//
//  LYCBuyCarInfoViewModel.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/3.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCBuyCarInfoViewModel.h"
#import "APIClient.h"
#import "Response.h"
#import "LYCBuyCarListModel.h"
@implementation LYCBuyCarInfoViewModel

- (void)handleDataWithSuccess:(void (^) (NSArray * arr))success failure:(void (^) (NSError *err))failure
{
    [[APIClient sharedManager] netWorkGetBuyCarInfoPageNo:self.pageNo pageSize:self.pageSize carLevel:self.carLevel cityId:self.cityId success:^(Response *response) {
        NSLog(@".......respone.description : %@",response.description);
//        if (response.status==kEnumServerStateSuccess) {
            NSLog(@"请求成功!");
          
            NSMutableArray *tmpArr=[NSMutableArray array];
           
            for (NSDictionary *subDic in (NSArray *)[response valueForKey:@"seriesList"]) {
              
                LYCBuyCarListModel *model=[[LYCBuyCarListModel alloc]initWithDic:subDic];
                
                [tmpArr addObject:model];
 
        }
         success(tmpArr);
    } failure:^(NSError *error) {
        
        failure(error);
    }];
    
}

@end
