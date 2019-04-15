//
//  WXQCustomLabelFlowConfig.m
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "WXQCustomLabelFlowConfig.h"

@implementation WXQCustomLabelFlowConfig

#pragma mark - Life Cycle
- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

+ (WXQCustomLabelFlowConfig *)shareConfig {
    static WXQCustomLabelFlowConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[WXQCustomLabelFlowConfig alloc]init];
    });
    return config;
}

- (instancetype)init {
    if (self = [super init]) {
        self.contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.lineSpace = 20;
        self.itemHeight = 25;
        self.itemSpace = 20;
        self.itemCornerRaius = 10;
        self.textEdge = 10;
        self.itemColor = [UIColor lightTextColor];
        self.textColor = [UIColor darkTextColor];
        self.labelFlowBgColor = [UIColor lightGrayColor];
        self.textFont = [UIFont systemFontOfSize:15];
    }
    return self;
}


@end
