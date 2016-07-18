//
//  ViewController.m
//  FKLoadingView
//
//  Created by Faker on 16/7/18.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "ViewController.h"
#import "FKLoadindicatorView.h"
#import "FKLoadWaitView.h"
#import "UIView+FKLoadMore.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     * 请求缓冲框事例一
     **/
//    [FKLoadindicatorView startIndicatorView:@"测试数据" style:IndicatorViewStyleWhiteLarge];
//    [FKLoadindicatorView finishIndicatorView];
  
    
    /**
     * 请求缓冲框事例二
     * 可以类的形式调用也可以 self.view 调用
     **/
//    [FKLoadWaitView startWaitView];
//    [FKLoadWaitView finishWaitView];
    [self.view loadViewShow];
    [self.view loadViewFinish];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
