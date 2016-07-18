//
//  UIView+FKLoadMore.m
//  FKLoadingView
//
//  Created by Faker on 16/7/18.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "UIView+FKLoadMore.h"
#import "FKLoadWaitView.h"

@implementation UIView (FKLoadMore)

- (void) loadViewShow
{
    [self loadViewFinish];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [FKLoadWaitView startWaitView];
    }];
    
}

- (void)loadViewFinish
{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [FKLoadWaitView finishWaitView];
    }];
}

@end
