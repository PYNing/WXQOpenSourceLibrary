//
//  WXQCustomLabelFlow.h
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedIndex)(NSUInteger index,NSString *title);
typedef void(^FinishHandler)(CGFloat height);
@interface WXQCustomLabelFlow : UIView

/**
 设置整个标签流背景颜色，默认是whiteColor
 */
@property (nonatomic, strong) UIColor *labelFlowBgColor;
/**
 设置单个标签背景色，默认是lightTextColor
 */
@property (nonatomic, strong) UIColor *itemColor;
/**
 设置标签字体颜色，默认是darkTextColor
 */
@property (nonatomic, strong) UIColor *textColor;
/**
 设置标签字体大小，默认是15
 */
@property (nonatomic, strong) UIFont *textFont;
/**
 设置标签整体距离四边的距离，默认是UIEdgeInsetsMake(10, 10, 10, 10)
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets;
/**
 设置两个标签行之间的高度，默认是20
 */
@property (nonatomic, assign) CGFloat lineSpace;
/**
 设置标签高度，默认是25
 */
@property (nonatomic, assign) CGFloat itemHeight;
/**
 设置两个标签之间宽度，默认是20
 */
@property (nonatomic, assign) CGFloat itemSpace;
/**
 设置标签裁剪角度，默认是10
 */
@property (nonatomic, assign) CGFloat itemCornerRaius;
/**
 设置文字两端边距，默认是10
 */
@property (nonatomic, assign) CGFloat textEdge;
/**
 设置边框宽度，默认不显示
 注意：若只设置aBorderWidth，则aBorderColor默认为blackColor
 */
@property (nonatomic, assign) CGFloat aBorderWidth;
/**
 设置边框颜色，默认不显示
 注意：若只设置aBorderColor，则aBorderWidth默认为1.0f
 */
@property (nonatomic, strong) UIColor *aBorderColor;

/**
 初始化
 
 @param frame   frame
 @param titles  标签名数组
 @param select  选中标签回调，返回选中标签名称和标签索引index
 @param hander  初始化完成回调，返回标签流整体高度
 */
- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                selectedIndex:(SelectedIndex)select
                finishHandler:(FinishHandler)hander;

@end

