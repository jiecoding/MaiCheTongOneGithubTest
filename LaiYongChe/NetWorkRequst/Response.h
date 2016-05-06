//
//  Response.h
//  TestNetworkReqOrAES(NOGit)
//
//  Created by laiyongche on 16/4/30.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,kEnumServerState) {
    kEnumServerStateSuccess = 1, //成功。
};

@interface Response : NSObject
@property (nonatomic,assign)kEnumServerState status;//请求结果返回
@property (nonatomic,strong) NSObject *data;
@property (nonatomic,copy) NSString *msg;

- (instancetype)initWithDictionary:(NSDictionary *)dic;



- (Response *)initWithState:(kEnumServerState)state result:(NSObject *)data message:(NSString *)message;

- (NSString *)description;
@end
