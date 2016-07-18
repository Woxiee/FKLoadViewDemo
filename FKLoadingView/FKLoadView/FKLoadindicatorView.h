//
//  FKLoadindicatorView.h
//  FKLoadingView
//
//  Created by Faker on 16/7/18.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadViewConst.h"

@interface FKLoadindicatorView : UIView
+ (void) startIndicatorView:(NSString *)text style:(IndicatorViewStyle)sty;
+ (void)finishIndicatorView;
@end
