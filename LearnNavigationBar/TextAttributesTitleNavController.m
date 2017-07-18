//
//  TextAttributesTitleNavController.m
//  LearnNavigationBar
//
//  Created by 印林泉 on 16/6/19.
//  Copyright © 2016年 yiq. All rights reserved.
//

#import "TextAttributesTitleNavController.h"

@interface TextAttributesTitleNavController ()

@end

@implementation TextAttributesTitleNavController

- (void)setTextAttributesTitle {
    NSString * titleStr = @"NSAttributedString";
    //前两个字母
    NSDictionary *firstAttributesDic =
    @{
      NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 18],
      NSForegroundColorAttributeName: [UIColor redColor],
      NSBackgroundColorAttributeName:[UIColor yellowColor],
      };
    NSAttributedString *firstAttributedStr = [[NSAttributedString alloc] initWithString: [titleStr substringWithRange:(NSRange){0,2}] attributes: firstAttributesDic];
    //第三个字母到最后
    NSDictionary *secondAttributesDic =
    @{
      NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],
      NSForegroundColorAttributeName: [UIColor yellowColor],
      NSBackgroundColorAttributeName:[UIColor redColor],
      };
    //[self.navigationBar setTitleTextAttributes:attributesDic];
    
    NSMutableAttributedString *secondAttributedStr = [[NSMutableAttributedString alloc]initWithString:[titleStr substringFromIndex:2] attributes:secondAttributesDic];
    
    NSRange range;
    
    range = [secondAttributedStr.string rangeOfString:@"String"];
    
    if (range.location != NSNotFound) {
        [secondAttributedStr setAttributes:firstAttributesDic range:range];
    }else{
        NSLog(@"Not Found");
    }
    //合并
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithAttributedString: firstAttributedStr];
    [attributedStr appendAttributedString: secondAttributedStr];
    
    [self.navigationItem setTitle:titleStr];
    [self.navigationBar setTitleTextAttributes:firstAttributesDic];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTextAttributesTitle];
    
    NSArray *familyNames = [UIFont familyNames];
    for(NSString *familyName in familyNames)
    {
        NSLog(@"%@", familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames)
        {
            NSLog(@"\t%@", fontName);
        }
    }
}

//设置状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
