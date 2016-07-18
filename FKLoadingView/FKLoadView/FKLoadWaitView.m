//
//  FKLoadWaitView.m
//  FKLoadingView
//
//  Created by Faker on 16/7/18.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "FKLoadWaitView.h"
#import "AppDelegate.h"
@implementation FKLoadWaitView

static FKLoadWaitView *waitView;

static UIImageView *imgView;

+ (void)initialize
{
    waitView = [[FKLoadWaitView alloc] init];
    [self initWaitView];
}

+ (void) initWaitView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat imgW = 30;
    [waitView setFrame:CGRectMake((width - imgW) * 0.5, (height - imgW) * 0.5, imgW, imgW)];
    
    //添加文字说明
    imgView = [[UIImageView alloc] init];
    [waitView addSubview:imgView];
    waitView.backgroundColor = [UIColor blackColor];
    imgView.image = [UIImage imageNamed:@"FKloadmoreimg0"];
    [imgView setFrame:waitView.bounds];
    AppDelegate *appdelegat = [[UIApplication sharedApplication] delegate];
   
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [ appdelegat.window addSubview:waitView];
    waitView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
}

+ (void) startWaitView
{
    waitView.hidden = NO;
    [self imageStartRotation];
}

+ (void)finishWaitView
{
    waitView.hidden = YES;
    [imgView.layer removeAllAnimations];
}

+ (void) imageStartRotation
{
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 300];
    rotationAnimation.repeatCount = 1;
    rotationAnimation.duration = 200.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [imgView.layer addAnimation:rotationAnimation forKey:nil];
}

@end
