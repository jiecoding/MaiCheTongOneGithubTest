//
//  UIView+WLFrame.h
//  
//
//  Created by long on 14/7/27.
//  Copyright (c) 2014年 WLong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (WLFrame)


//  高度
@property (nonatomic,assign) CGFloat height;
//  宽度
@property (nonatomic,assign) CGFloat width;

//  Y
@property (nonatomic,assign) CGFloat top;
//  X
@property (nonatomic,assign) CGFloat left;

//  Y + Height
@property (nonatomic,assign) CGFloat bottom;
//  X + width
@property (nonatomic,assign) CGFloat right;

@end
