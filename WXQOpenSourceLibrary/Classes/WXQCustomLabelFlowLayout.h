//
//  WXQCustomLabelFlowLayout.h
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WXQCustomLabelFlowLayoutDelegate <NSObject>

/**
 获取每个标签的title
 
 @param indexPath  indexPath
 */
- (NSString *)titleForLabelAtIndexPath:(NSIndexPath *)indexPath;

@optional
/**
 创建完成之后返回的标签流行数
 
 @param number 标签流行数
 */
- (void)layoutFinishedLineNumber:(NSInteger)number;

@end

@interface WXQCustomLabelFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, weak)id <WXQCustomLabelFlowLayoutDelegate> delegate;

@end
