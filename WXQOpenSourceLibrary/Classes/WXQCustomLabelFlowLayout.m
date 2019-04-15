//
//  WXQCustomLabelFlowLayout.m
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "WXQCustomLabelFlowLayout.h"
#import "WXQCustomLabelFlowConfig.h"

@implementation WXQCustomLabelFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    kWXQFlowConfig.lineCount = 0;
    kWXQFlowConfig.lineX = kWXQFlowConfig.contentInsets.left;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    for (NSInteger i = 0; i<attributesArray.count; i++) {
        UICollectionViewLayoutAttributes *att = attributesArray[i];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        NSString *title = [self.delegate titleForLabelAtIndexPath:indexPath];
        CGSize size = [self sizeWithTitle:title font:kWXQFlowConfig.textFont];
        CGFloat itemOrginX = kWXQFlowConfig.lineX;
        CGFloat itemOrginY = kWXQFlowConfig.lineCount*(kWXQFlowConfig.itemHeight+kWXQFlowConfig.lineSpace) + kWXQFlowConfig.contentInsets.top;
        CGFloat itemWidth = size.width+kWXQFlowConfig.textEdge*2;
        if (itemWidth > CGRectGetWidth(self.collectionView.frame)-(kWXQFlowConfig.contentInsets.left+kWXQFlowConfig.contentInsets.right)) {
            itemWidth = CGRectGetWidth(self.collectionView.frame)-(kWXQFlowConfig.contentInsets.left+kWXQFlowConfig.contentInsets.right);
        }
        att.frame = CGRectMake(itemOrginX, itemOrginY, itemWidth, kWXQFlowConfig.itemHeight);
        NSLog(@"frame = %@",NSStringFromCGRect(att.frame));
        kWXQFlowConfig.lineX += itemWidth+kWXQFlowConfig.itemSpace;
        if (i < attributesArray.count-1) {
            NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:i+1 inSection:0];
            NSString *nextTitle = [self.delegate titleForLabelAtIndexPath:nextIndexPath];
            CGSize nextSize = [self sizeWithTitle:nextTitle font:kWXQFlowConfig.textFont];
            if (nextSize.width+kWXQFlowConfig.textEdge*2 > CGRectGetWidth(self.collectionView.frame)-kWXQFlowConfig.contentInsets.right-kWXQFlowConfig.lineX) {
                kWXQFlowConfig.lineCount ++;
                kWXQFlowConfig.lineX = kWXQFlowConfig.contentInsets.left;
            }
        }
        else {
            [self.delegate layoutFinishedLineNumber:kWXQFlowConfig.lineCount+1];
        }
    }
    return attributesArray;
}

- (CGSize)sizeWithTitle:(NSString *)title font:(UIFont *)font {
    CGRect rect = [title boundingRectWithSize:CGSizeMake(1000, kWXQFlowConfig.itemHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}

@end
