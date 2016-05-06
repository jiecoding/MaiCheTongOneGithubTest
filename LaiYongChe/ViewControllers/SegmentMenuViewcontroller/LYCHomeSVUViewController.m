//
//  LYCHomeSVUViewController.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/5.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCHomeSVUViewController.h"
#import "TWCollectionViewController.h"
#import "Constants.h"

@interface LYCHomeSVUViewController ()

@end

@implementation LYCHomeSVUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.view.frame =  CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    TWCollectionViewController *_collectionController = [[TWCollectionViewController alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    _collectionController.hidden = NO;
    [self.view addSubview:_collectionController];
    _collectionController.backgroundColor = [UIColor redColor];

//    self.view.backgroundColor = [UIColor clearColor];
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
