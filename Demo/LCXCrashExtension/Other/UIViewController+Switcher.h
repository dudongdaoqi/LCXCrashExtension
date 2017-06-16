//
//  UIViewController+Switcher.h
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Switcher)

/**
 push一个控制器

 @param className push控制器的类名
 @param animated 是否有动画
 */
- (void)pushClassViewController:(NSString *)className animated:(BOOL)animated;


@end
