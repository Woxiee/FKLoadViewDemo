//
//  FKLoadindicatorView.m
//  FKLoadingView
//
//  Created by Faker on 16/7/18.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "FKLoadindicatorView.h"
#import "UIView+Extension.h"
#import "NSString+Extension.h"
#import "AppDelegate.h"
@implementation FKLoadindicatorView

static FKLoadindicatorView *waitView;
static UIActivityIndicatorView *indicatorView;
static IndicatorViewStyle style;
static NSString *context;


+ (void) startIndicatorView:(NSString *)text style:(IndicatorViewStyle)sty
{
    style = sty;
    context = text;
    
    [self addView];
    [indicatorView startAnimating];
}

+ (void)finishIndicatorView
{
    [indicatorView stopAnimating];
    [waitView removeFromSuperview];
}

+ (void)addView
{
    if (style == IndicatorViewStyleWhiteLarge) {
        
        waitView = [[FKLoadindicatorView alloc] init];
        [waitView setFrame:[UIScreen mainScreen].bounds];
        //添加文字说明
        
        AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
        waitView.backgroundColor = [UIColor whiteColor];
        
        [appdelegate.window addSubview:waitView];
        
        indicatorView = [[UIActivityIndicatorView alloc] init];
        [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        //添加view
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        UIView *pView = [UIView new];
        [waitView addSubview:pView];
        CGFloat pW = 90;
        [pView setFrame:CGRectMake((width - pW) * 0.5, (height - pW) * 0.5, pW, pW)];
        [pView layerForViewWith:15.0 AndLineWidth:1.0];
        pView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [pView addSubview:indicatorView];
        CGRect frame = pView.bounds;
        frame.origin.y = frame.origin.y - 10;
        [indicatorView setFrame:frame];
        
        UILabel *title = [UILabel new];
        title.text = context;
        title.textColor = [UIColor blackColor];
        [pView addSubview:title];
        [title setTextAlignment:NSTextAlignmentCenter];
        [title setFont:[UIFont boldSystemFontOfSize:14]];
        [title setFrame:CGRectMake(0, pView.frame.size.height - 40, pView.frame.size.width, 40)];
    }
    else if (style == IndicatorViewStyleGray){
        
        waitView = [[FKLoadindicatorView alloc] init];
        [waitView setFrame:[UIScreen mainScreen].bounds];
        
        //添加文字说明
        
        AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
        waitView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [appdelegate.window addSubview:waitView];
        
        indicatorView = [[UIActivityIndicatorView alloc] init];
        [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [indicatorView setFrame:waitView.frame];
        [waitView addSubview:indicatorView];
    }
    else if (style == IndicatorViewStyleAuto)
    {
        waitView = [[FKLoadindicatorView alloc] init];
        [waitView setFrame:[UIScreen mainScreen].bounds];
        
        //添加文字说明
        
        AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
        waitView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        [appdelegate.window addSubview:waitView];
        
        indicatorView = [[UIActivityIndicatorView alloc] init];
        [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        CGSize textMaxSize = CGSizeMake(width - 60, MAXFLOAT);
        CGSize stringSize = [context sizeWithFont:[UIFont boldSystemFontOfSize:16] maxSize:textMaxSize];
        
        //添加view
        UIView *pView = [UIView new];
        [waitView addSubview:pView];
        CGFloat pW = stringSize.width > 90 ? stringSize.width: 90;
        CGFloat pH = stringSize.height + 70;
        
        [pView setFrame:CGRectMake((width - pW) * 0.5, (height - pH) * 0.5, pW, pH)];
        [pView layerForViewWith:8.0 AndLineWidth:1.0];
        
        pView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [pView addSubview:indicatorView];
        CGFloat indicatorW = 20;
        CGRect frame = CGRectMake((pView.frame.size.width - indicatorW) * 0.5, 20, indicatorW, indicatorW);
        [indicatorView setFrame:frame];
        
        UILabel *title = [UILabel new];
        title.text = context;
        title.textColor = [UIColor whiteColor];
        [pView addSubview:title];
        [title setTextAlignment:NSTextAlignmentCenter];
        title.numberOfLines = 0;
        [title setFont:[UIFont boldSystemFontOfSize:14]];
        [title setFrame:CGRectMake(10, indicatorW + 20, pView.frame.size.width - 20, pView.frame.size.height - indicatorW - 20)];
    }
}


@end

