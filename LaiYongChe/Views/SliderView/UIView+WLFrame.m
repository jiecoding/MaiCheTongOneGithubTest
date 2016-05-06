//
//  UIView+WLFrame.m
//  
//
//  Created by long on 14/7/27.
//  Copyright (c) 2014年 WLong. All rights reserved.
//

#import "UIView+WLFrame.h"

@implementation UIView (WLFrame)

//  返回高度
- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight
{
    //  结构体的点语法 没有set get方法
    //  不能直接进行赋值
    //  正能通过 结构体的整个赋值
    //  虽然都是点 但是意思不一样
    //  以后结构就这么赋值
    //  1.用一个变量接收结构体
    //  2.修改这个新结构体变量的某一个值
    //  3.重新赋值新的结构体
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}
//  返回宽度
- (CGFloat)width
{
    return self.frame.size.width;
}

//  设置宽度
- (void)setWidth:(CGFloat)newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

//  返回Y
- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

//  返回X
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

//  返回Y + Height
- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

//  返回X + width
- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}



@end
