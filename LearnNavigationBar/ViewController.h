//
//  ViewController.h
//  LearnNavigationBar
//
//  Created by 印林泉 on 16/6/11.
//  Copyright © 2016年 yiq. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation CALayer (Additions)
- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end

@interface ViewController : UIViewController

@end

