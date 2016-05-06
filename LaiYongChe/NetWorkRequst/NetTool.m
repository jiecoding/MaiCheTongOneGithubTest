//
//  NetTool.m
//  TestNetworkReqOrAES(NOGit)
//
//  Created by laiyongche on 16/4/30.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "NetTool.h"
#import "AFNetworking.h"
#import "Constants.h"
#import "Response.h"
@implementation NetTool

+(NetTool *)shareManager
{
    static NetTool *manager = nil;
    static dispatch_once_t once ;
    
    dispatch_once(&once, ^{
       
        if(manager == nil)
        {
            manager = [[NetTool alloc] init];
        }
        
    });
    return manager;
    
}

- (void)httpGetRequest:(NSString *)url withParameter:(NSDictionary *)parameter success:(void (^)(Response *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //必须设置成YES
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    //每次开始下载任务前做如下判断。 为什么要这样做？
//    NSMutableArray *requestArray = [NSMutableArray array];
//    for (NSString *request in requestArray) {
//        
//        if([url isEqualToString:request])
//        {
//            return;
//        }
//    }
//    [requestArray addObject:url];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain",@"text/html",nil];

    
    [manager GET:url parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSString *responseString = [operation responseString];
       
        NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //为什么有的人用 responseObject 直接获取值 有的用operation？
        //结合apdai的请求写 根据适合自己的方式来写参数类型。这里看接口返回参数 再考虑要不要用Response这个类。关于这个类 还是要思考下用处的 ????
//        Response *responseObj =[[Response alloc] initWithDictionary:jsonDic];
        
         DLog(@"jsonDic:%@",jsonDic);
        
        success(jsonDic);
      
//        [requestArray removeObject:url];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
//            [requestArray removeObject:url];
        }
    }];
    
    
}

@end
