//
//  WXQCustomLabelFlowCell.m
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "WXQCustomLabelFlowCell.h"
#import "WXQCustomLabelFlowConfig.h"

NSString *const collectionViewCellIdentifier = @"collectionViewCellIdentifier";
@implementation WXQCustomLabelFlowCell

#pragma mark - Life Cycle
- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.label];
    }
    return self;
}
#pragma mark - Getters and Setters
- (void)setTitle:(NSString *)title {
    _title = title;
    self.label.frame = self.bounds;
    self.label.text = title;
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.backgroundColor = kWXQFlowConfig.itemColor;
        _label.textColor = kWXQFlowConfig.textColor;
        _label.font = kWXQFlowConfig.textFont;
        _label.textAlignment = NSTextAlignmentCenter;
        if (kWXQFlowConfig.itemCornerRaius > 0.0) {
            _label.layer.cornerRadius = kWXQFlowConfig.itemCornerRaius;
            _label.layer.masksToBounds = YES;
        }
        if (kWXQFlowConfig.aBorderColor || kWXQFlowConfig.aBorderWidth) {
            _label.layer.borderWidth = kWXQFlowConfig.aBorderWidth ? : 1.0f;
            _label.layer.borderColor = kWXQFlowConfig.aBorderColor ? kWXQFlowConfig.aBorderColor.CGColor : [UIColor blackColor].CGColor;
        }
    }
    return _label;
}


@end
