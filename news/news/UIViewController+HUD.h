//
//  UIViewController+HUD.h
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHudInView:(UIView *)view showHint:(NSString *)hint;

@end