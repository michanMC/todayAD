//
//  HATestView.m
//  HAScrollNavBar
//
//  Created by haha on 15/7/19.
//  Copyright (c) 2015年 haha. All rights reserved.
//

#import "HATestView.h"
#import "UIView+Extension.h"
#import "RecommendViewController.h"
@implementation HATestView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)setKeyStr:(NSString *)keyStr
{
    _keyStr = keyStr;
    if ([keyStr isEqualToString:@"推荐"]) {
        RecommendViewController * vc = [[RecommendViewController alloc]init];
        vc.view.frame = self.frame;
        
        [self addSubview:vc.view];
        
    }
 
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    self.label.width = self.width;
//    self.label.height = self.height;
//    self.label.x = 0;
//    self.label.y = 0;
}
@end
