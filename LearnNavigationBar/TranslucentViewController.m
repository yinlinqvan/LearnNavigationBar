//
//  TranslucentViewController.m
//  LearnNavigationBar
//
//  Created by 印林泉 on 2017/7/18.
//  Copyright © 2017年 yiq. All rights reserved.
//

#import "TranslucentViewController.h"

#define NAVBAR_COLORCHANGE_POINT (-64)
///#define IMAGE_HEIGHT 225
#define NAV_HEIGHT 64
#define SCROLL_DOWN_LIMIT 64
#define LIMIT_OFFSET_Y -(NAVBAR_COLORCHANGE_POINT + SCROLL_DOWN_LIMIT)

@interface TranslucentViewController ()<UIScrollViewDelegate>

@end

@implementation TranslucentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [self setNavBarBackgroudAlpha:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < NAVBAR_COLORCHANGE_POINT) {
        [self setNavBarBackgroudAlpha:0];//恢复
    }
    else {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self setNavBarBackgroudAlpha:alpha];
    }
}

//- (void)setNavBarAlpha:(CGFloat)alpha {
//    //设置控件透明度
//    for (UIView *view in self.navigationController.navigationBar.subviews) {
//        //不是系统返回按钮
//        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] == NO) {
//            view.alpha = alpha;
//        }
//    }
//}

- (void)setNavBarBackgroudAlpha:(CGFloat)alpha {
    //设置导航栏透明度
    UIView *barBackgroudView = self.navigationController.navigationBar.subviews.firstObject;
    barBackgroudView.alpha = alpha;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
