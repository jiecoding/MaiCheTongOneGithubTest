//
//  LYCTightViewController.m
//  LaiYongChe
//
//  Created by laiyongche on 16/5/3.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "LYCTightViewController.h"
#import "TWCollectionViewController.h"
#import "Constants.h"

@implementation LYCTightViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.view.frame =  CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    TWCollectionViewController *_collectionController = [[TWCollectionViewController alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _collectionController.backgroundColor = [UIColor yellowColor];

    _collectionController.hidden = NO;
    [self.view addSubview:_collectionController];
    
//    self.view.backgroundColor = [UIColor clearColor];
}

@end
