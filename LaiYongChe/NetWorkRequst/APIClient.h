//
//  APIClient.h
//  TestNetworkReqOrAES(NOGit)
//
//  Created by laiyongche on 16/4/30.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
@interface APIClient : NSObject

+ (APIClient *)sharedManager;

- (void)netWorkGetBuyCarInfoPageNo:(NSString *)pageNo pageSize:(NSString *)pageSize carLevel:(NSString *)carLevel cityId:(NSString *)cityId success:(void (^) (Response *response))success failure:(void (^) (NSError *error))failure;
//
//- (void)netWorkGetAccessKeyUserName:(NSString *)userName success:(void (^) (NSDictionary *response))success failure:(void (^) (NSError *error))failure;

@end
