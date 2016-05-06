//
//  LYCLeftSliderCell.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/28.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCLeftSliderCell.h"
#import "Constants.h"
#import "UIFont+LYCFontToolkit.h"
#import <Masonry/Masonry.h>
@implementation LYCLeftSliderCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setUpView];
    }
    return self;
}

- (void)setUpView
{
    //这样写的好处是:延迟实例化 只有真正用到的时候，这个对象才会被创n建。节约了内存
    [self addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SCREEN_WIDTH /4+10));
        make.top.equalTo(self).offset(15);
        make.height.equalTo(self).multipliedBy(.45);
        make.width.equalTo(self).multipliedBy(.13);
    }];
    
    [self addSubview:self.title];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SCREEN_WIDTH /5 +20));
        make.top.equalTo(self.mas_bottom).offset(-48);
        make.height.equalTo(self).multipliedBy(.25);
        make.width.equalTo(self).multipliedBy(.23);
    }];
    
    
}

- (UIImageView *)iconImageView
{
    if(!_iconImageView)
    {
        _iconImageView = [[UIImageView alloc] init];
     //代码写死宽高 由于 plus的高度不同 所以差别很大，我们先换种方法
//        _iconImageView.frame = CGRectMake(SCREEN_WIDTH /4+10, 10,44,44);
        
        _iconImageView.image = [UIImage imageNamed:@"slider_cell_sale"];
//        _iconImageView.backgroundColor = [UIColor yellowColor];
    }
    
    return _iconImageView;
    
}

- (UILabel *)title
{
    if(!_title)
    {
        _title = [[UILabel  alloc] init];
//        _title.frame = CGRectMake(SCREEN_WIDTH /5 +20, 60, 80,20);
        _title.textColor = [UIColor lightGrayColor];
        _title.font = [UIFont getAdaptiveFontWithPix:13.0f];
//        _title.backgroundColor =[UIColor redColor];
     }
    
    return _title;
    
}

@end
