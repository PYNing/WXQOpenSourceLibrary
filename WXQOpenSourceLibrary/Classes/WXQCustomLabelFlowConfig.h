//
//  WXQCustomLabelFlowConfig.h
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kWXQFlowConfig    [WXQCustomLabelFlowConfig shareConfig]
@interface WXQCustomLabelFlowConfig : NSObject

@property (nonatomic, assign) UIEdgeInsets contentInsets; ///整个标签流距离四周的距离
@property (nonatomic, assign) CGFloat lineSpace; ///两个标签行上下之间的高度
@property (nonatomic, assign) CGFloat itemHeight; ///单个标签高度
@property (nonatomic, assign) CGFloat itemSpace; ///两个标签之间宽度
@property (nonatomic, assign) CGFloat itemCornerRaius; ///标签裁剪角度
@property (nonatomic, assign) CGFloat lineX; ///行距左边距的距离
@property (nonatomic, assign) CGFloat textEdge; ///文字两端边距
@property (nonatomic, assign) NSInteger lineCount; ///标签行数
@property (nonatomic, strong) UIColor *itemColor; ///标签背景色
@property (nonatomic, strong) UIColor *textColor; ///标签字体颜色
@property (nonatomic, strong) UIColor *labelFlowBgColor; ///整个标签流背景色
@property (nonatomic, strong) UIFont *textFont; ///标签字体大小
@property (nonatomic, assign) CGFloat aBorderWidth; ///边框宽度
@property (nonatomic, strong) UIColor *aBorderColor; ///边框颜色

+ (WXQCustomLabelFlowConfig *)shareConfig;

@end

