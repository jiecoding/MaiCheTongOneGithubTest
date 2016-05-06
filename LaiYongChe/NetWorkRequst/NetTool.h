//
//  NetTool.h
//  TestNetworkReqOrAES(NOGit)
//
//  Created by laiyongche on 16/4/30.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
@interface NetTool : NSObject

+ (NetTool *)shareManager;

- (void)httpGetRequest:(NSString *)url withParameter:(NSDictionary *)parameter success:(void (^)(Response *response))success failure:(void (^) (NSError *error))failure;
@end
