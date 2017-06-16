//
//  UIViewController+Switcher.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "UIViewController+Switcher.h"

@implementation UIViewController (Switcher)

- (void)pushClassViewController:(NSString *)className animated:(BOOL)animated{
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        if (ctrl) {
            ctrl.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ctrl animated:animated];
        }
    }
}


@end
