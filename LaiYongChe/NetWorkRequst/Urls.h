//
//  Urls.h
//  TestNetworkReqOrAES(NOGit)
//
//  Created by laiyongche on 16/5/1.
//  Copyright © 2016年 LYC. All rights reserved.
//

#ifndef Urls_h
#define Urls_h

#define kApi_Get_Login @"http://cloud.bmob.cn/f8bb56aa119e68ee/news_list_2_0"

#define BaseURL  @"http://api-1.apengdai.com/api/v2/"


#define RQURL_ASEEncryption BaseURL@"user/accessKey?"           //aes加密接口

#define RQURL_LOGIN                BaseURL@"user/login?"                             //登陆

//车网api

#define BaseCheURL  @"http://api.tool.chexun.com/mobile/"

#define Home_BuyCar  BaseCheURL@"buyCarSeriesInfo.do?"



#endif /* Urls_h */
