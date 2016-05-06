//
//  LYCCarModelBaseVC.m
//  LaiYongChe
//网上找的测试http://www.cocoachina.com/bbs/read.php?tid=331782
//  Created by laiyongche on 16/5/3.
//  Copyright © 2016年 laiyongche. All rights reserved.
//http://www.jb51.net/article/70879.htm

#import "LYCCarModelBaseVC.h"
#import "UIFont+LYCFontToolkit.h"
//#import "UIScrollView+UITouch.h"
#import "Constants.h"
//#import "LYCCarModelCell.h"

#import "UIImageView+WebCache.h"
#import "UIView+WLFrame.h"
@interface LYCCarModelBaseVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_indexArr;//数据源
    UILabel *_indexLabel;//索引条
    UILabel *_indexView;//中间索引view
    NSArray *_carModelPlist;//车型库plist文件获取数组
    
    int a_zCarCount;//字母包含车的数量
    int operationCarCount;//对每行显示的car数量进行一次运算
    
    int sectionCurrentNumber; //有效保存当前section的参数
    BOOL sectionOnly; //是否是第一次进入section
    int operationGetCarIndex;    //进行运算 赋值取数组对应参数
    //不要在cell里创建对象。
    NSArray *arr;
}
@end

@implementation LYCCarModelBaseVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //读取plist 关于字典读取为什么会打印出nil：http://blog.csdn.net/snn1410/article/details/7290418
    NSLog(@"%@",[NSBundle mainBundle]);
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"];
    
    _carModelPlist = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSLog(@"carsARR：%@", _carModelPlist);//直接打印数据。
    //    test = 8;
    
    sectionOnly = YES;
    sectionCurrentNumber = 0;
    
    self.title = @"车型库";
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, width -20, height-20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    
    
    
    
    UIScrollView *bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(width-35,84, 33, height /1.4)];
    bottomScrollView.contentSize = CGSizeMake(0, height*2.1);
    bottomScrollView.userInteractionEnabled = YES;
    [self.view addSubview:bottomScrollView];
    
    
    //初始化索引条
    //    _indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(width-35,84, 33, height /1.4)];
    _indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 33, height*2.1)];
    
    _indexLabel.numberOfLines = 0;
    _indexLabel.font = [UIFont getAdaptiveFontWithPix:13.0f];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.textColor = [UIColor blackColor];
    _indexLabel.backgroundColor = [UIColor clearColor];
    _indexLabel.userInteractionEnabled = YES;
    
    _indexLabel.alpha = 0.7;
    
    
    [bottomScrollView addSubview:_indexLabel];
    
    UITapGestureRecognizer *tapLabelIndex = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIndexEvent:)];
    
    [_indexLabel addGestureRecognizer:tapLabelIndex];
    
    
    //    bottomScrollView.backgroundColor = [UIColor greenColor];
    
    //初始化数据源
    _indexArr = [[NSMutableArray alloc]init];
    for (int i = 0; i<26; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%c",i+65];
        [_indexArr addObject:str];
        _indexLabel.text = i == 0? str:[NSString stringWithFormat:@"%@\n\n\n%@",_indexLabel.text,str];
        
    }
    //初始化中间的索引view
    _indexView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _indexView.layer.cornerRadius = _indexView.frame.size.width/2;
    _indexView.layer.masksToBounds = YES;
    _indexView.textColor = [UIColor redColor];
    
    _indexView.center = self.view.center;
    _indexView.textAlignment = NSTextAlignmentCenter;
    _indexView.alpha = 0.0;
    _indexView.backgroundColor = [UIColor brownColor];
    _indexView.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:_indexView];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0f green:233/255.0f blue:235/255.0f alpha:1];
    _tableView.backgroundColor = [UIColor colorWithRed:232/255.0f green:233/255.0f blue:235/255.0f alpha:1];
    
    
    
}

- (void)tapIndexEvent:(UITapGestureRecognizer *)gestureRecognizer
{
    
    [self mytouches:gestureRecognizer];
    
    [UIView animateWithDuration:2.5 animations:^{//让中间的view消失
        _indexView.alpha = 0.0;
    } completion:nil];
}

//点击事件的回调
- (void)mytouches:(UITapGestureRecognizer *)touches{
    
    [UIView animateWithDuration:2.5 animations:^{//让中间的view显现
        _indexView.alpha = 1.0;
    }completion:nil];
    //获取点击的点
    //    UITouch *touch = [touches anyObject];
    CGPoint point = [touches locationInView:_indexLabel];
    int index = (int)(point.y/(SCREEN_HEIGHT *2.1)*26);
    if (index>25|index<0) {
        return;
    }
    //给索引view赋标题
    _indexView.text = _indexArr[index];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    //_tableView 回滚
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    return arc4random()%5 +1;
    NSDictionary *dic =[_carModelPlist objectAtIndex:section];
    
    NSArray *arr2 = [dic objectForKey:@"cars"];
    
    return ceil(arr2.count/3.0f);
    //
    //http://www.ithao123.cn/content-3168409.html
    //    return 2;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     http://www.bkjia.com/Androidjc/913755.html
     cell 重用
     */
    //    static NSString *identifier = @"SimpleTableViewCell";
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = (UITableViewCell*)[tableView
                                               
                                               dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
        
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if(sectionOnly || sectionCurrentNumber!=indexPath.section)
        {
            NSDictionary *dic =[_carModelPlist objectAtIndex:indexPath.section];
            
            arr = [dic objectForKey:@"cars"];
            
            NSLog(@"arr.count:%ld",arr.count);
            a_zCarCount = (int)arr.count;
            
            sectionCurrentNumber = (int)indexPath.section;
            sectionOnly = NO;
            
            operationGetCarIndex = 0;
            
        }
        
        if(a_zCarCount >3)
        {
            operationCarCount = 3;
            a_zCarCount = a_zCarCount -3;
        }
        else
        {
            operationCarCount = a_zCarCount;
        }
        
        NSDictionary *dic = [[NSDictionary alloc] init];
        
        for (int i = 0; i <operationCarCount; i++) {
            
            operationGetCarIndex = operationGetCarIndex + 1;
            UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake((_tableView.width/3 ) *i , 0, _tableView.width/3 -3 ,92)];
            view1.backgroundColor = [UIColor whiteColor];
            [cell addSubview:view1];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, view1.bottom - 30, view1.width, 20)];
            label1.text = [NSString stringWithFormat:@"兰博基尼%d",i];
            label1.font = [UIFont getAdaptiveFontWithPix:13.0f];
            
            dic = [arr objectAtIndex:operationGetCarIndex -1];
            
            
            label1.text = [dic objectForKey:@"name"];
            
            [view1 addSubview:label1];
            
            UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(view1.width/2 -15, view1.top +20, 30, 30)];
            NSString *urlStr2 = @"http://i0.chexun.net/images/2015/0601/16892/logo_100_100_919A034DE5C2F9C658B582854994CE67.jpg";
            
            //
            NSString *urlStr = @"http://i3.chexun.net/images/2015/0113/16627/logo_100_100_22662DFF5100682741A7A918724E256A.jpg";
            if(i/2!=0){
                [imageView1 sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"carLogo"]];
            }
            else
            {
                [imageView1 sd_setImageWithURL:[NSURL URLWithString:urlStr2] placeholderImage:[UIImage imageNamed:@"carLogo"]];
                
            }
            [view1 addSubview:imageView1];
            
            
        }
        
        //        NSString *urlStr2 = @"http://i0.chexun.net/images/2015/0601/16892/logo_100_100_919A034DE5C2F9C658B582854994CE67.jpg";
    }
    
    cell.backgroundColor =[UIColor colorWithRed:232/255.0f green:233/255.0f blue:235/255.0f alpha:1];
    
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _carModelPlist.count;
    //    return 1;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return _indexArr[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return 95;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
