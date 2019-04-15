//
//  WXQCustomLabelFlowCell.h
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const collectionViewCellIdentifier;
@interface WXQCustomLabelFlowCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, copy) NSString *title;

@end

