//
//  ViewController.m
//  LearnNavigationBar
//
//  Created by 印林泉 on 16/6/11.
//  Copyright © 2016年 yiq. All rights reserved.
//

#import "ViewController.h"

#define NAVBAR_COLORCHANGE_POINT (-64)
#define IMAGE_HEIGHT 225
#define NAV_HEIGHT 64
#define SCROLL_DOWN_LIMIT 0
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [self setNavBarOpaque];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < NAVBAR_COLORCHANGE_POINT) {//下拉
        CGFloat alpha = 1- (NAVBAR_COLORCHANGE_POINT - offsetY) / NAV_HEIGHT;
        [self setNavBarAlpha:alpha];
    }
    else {
        [self setNavBarAlpha:1.0];
    }
}

- (void)scrollViewDidScroll3:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT) {
        [self setNavBarAlpha:1.0];
    }
    else {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self setNavBarAlpha:alpha];
    }
}

- (void)scrollViewDidScroll2:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= NAVBAR_COLORCHANGE_POINT)
    {
        [self changeNavBarAnimateWithIsClear:NO];
    }
    else
    {
        [self changeNavBarAnimateWithIsClear:YES];
    }
}

- (void)changeNavBarAnimateWithIsClear:(BOOL)isClear
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.6 animations:^
     {
         __strong typeof(self) pThis = weakSelf;
         if (isClear == YES) {
             [pThis setNavBarAlpha:0];
         } else {
             [pThis setNavBarAlpha:1.0];
         }
     }];
}

- (void)setNavBarAlpha:(CGFloat)alpha {
    //设置控件透明度
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        //不是系统返回按钮
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] == NO) {
            view.alpha = alpha;
        }
    }
}

- (void)setNavBarOpaque {
    //设置控件透明度
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        //不是系统返回按钮
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] == NO) {
            view.alpha = 1;
        }
    }
}

- (void)setNavBarTranslucent {
    //设置控件透明度
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        view.alpha = 0;
    }
}

- (void)setNavBarBackgroudOpaque {
    //设置导航栏透明度
    UIView *barBackgroudView = self.navigationController.navigationBar.subviews.firstObject;
    barBackgroudView.alpha = 1;
}

- (void)setNavBarBackgroudTranslucent {
    //设置导航栏透明度
    UIView *barBackgroudView = self.navigationController.navigationBar.subviews.firstObject;
    barBackgroudView.alpha = 0;
}


- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
