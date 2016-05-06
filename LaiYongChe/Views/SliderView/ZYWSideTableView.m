//
//  ZYWSideTableView.m
//  ZYWQQ
//
//  Created by Devil on 16/2/23.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "ZYWSideTableView.h"
#import "LYCLeftSliderCell.h"
#import "Constants.h"
@interface ZYWSideTableView()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_leftListTitleArr;
    NSMutableArray *_leftListImageIconArr;

}

@end

@implementation ZYWSideTableView

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    //    设置代理和数据源
    self.delegate=self;
    self.dataSource=self;
    
    self.rowHeight=50;
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle=NO;
    self.scrollEnabled = NO;
    
    _leftListTitleArr=[[NSMutableArray alloc] initWithObjects:@"搜索车系",@"降价行情",@"新车导购",@"车型对比", nil];
    _leftListImageIconArr = [[NSMutableArray alloc] initWithObjects:@"slider_cell_seachicon",@"slider_cell_sale",@"slider_cell_newicon",@"slider_cell_pk", nil];
    
//    [self setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    return  self;
}



//实现数据源方法
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _leftListTitleArr.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"TableViewCell";
 
        LYCLeftSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
           
            cell = [[LYCLeftSliderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

        }
        cell.backgroundColor=[UIColor clearColor];
    
        cell.title.text = [_leftListTitleArr objectAtIndex:indexPath.row];
        NSString *imageNameStr = [NSString stringWithFormat:@"%@",[_leftListImageIconArr objectAtIndex:indexPath.row]];
        cell.iconImageView.image = [UIImage imageNamed:imageNameStr];
 
        return cell;
 

    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        return SCREEN_HEIGHT/6 +10;
 
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DLog(@"jnkjn");
    
}

@end
