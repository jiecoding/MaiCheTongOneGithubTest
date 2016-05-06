//
//  UIFont+LYCFontToolkit.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/2.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "UIFont+LYCFontToolkit.h"
@implementation UIFont (LYCFontToolkit)

+ (UIFont *)getAdaptiveFontWithPix:(CGFloat)pix
{
    pix = pix *2;
    pix = [UIScreen mainScreen].bounds.size.width / 640 * pix ;
    return [UIFont systemFontOfSize:pix];
}

@end
