//
//  WXQCustomLabelFlow.m
//  WXQCustomLabelFlowDemo
//
//  Created by WXQ on 2019/4/11.
//  Copyright © 2019 WXQ. All rights reserved.
//

#import "WXQCustomLabelFlow.h"
#import "WXQCustomLabelFlowCell.h"
#import "WXQCustomLabelFlowConfig.h"
#import "WXQCustomLabelFlowLayout.h"

@interface WXQCustomLabelFlow()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
WXQCustomLabelFlowLayoutDelegate
>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) WXQCustomLabelFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, copy) SelectedIndex select;
@property (nonatomic, copy) FinishHandler hander;

@end

@implementation WXQCustomLabelFlow

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
                       titles:(NSArray *)titles
                selectedIndex:(SelectedIndex)select
                finishHandler:(FinishHandler)hander
{
    if (CGRectEqualToRect(frame, CGRectZero)) {
        frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    self = [super initWithFrame:frame];
    if (titles.count == 0) return self;
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.titles = [NSMutableArray arrayWithArray:titles];
        self.select = select;
        self.hander = hander;
        [self setUpSubViews];
    }
    return self;
}
#pragma mark - Private Methods
// Methods…(.m中声明)
- (void)setUpSubViews {
    [self addSubview:self.collectionView];
}
#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WXQCustomLabelFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    cell.title = self.titles[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.select) {
        NSUInteger index = indexPath.item;
        NSString *title = self.titles[index];
        self.select(index,title);
    }
}
#pragma mark - WXQCustomLabelFlowLayoutDelegate
- (NSString *)titleForLabelAtIndexPath:(NSIndexPath *)indexPath {
    return self.titles[indexPath.row];
}
- (void)layoutFinishedLineNumber:(NSInteger)number {
    static NSInteger numberCount;
    if (numberCount == number) {
        return;
    }
    numberCount = number;
    CGFloat height = kWXQFlowConfig.contentInsets.top + kWXQFlowConfig.contentInsets.bottom + kWXQFlowConfig.itemHeight * number + kWXQFlowConfig.lineSpace * (number-1);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    [UIView animateWithDuration:0.2 animations:^{
        self.collectionView.frame = self.bounds;
        if (self.hander) {
            self.hander(self.bounds.size.height);
        }
    }];
}
#pragma mark - Getters and Setters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = kWXQFlowConfig.labelFlowBgColor;
        _collectionView.allowsMultipleSelection = YES;
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[WXQCustomLabelFlowCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    }
    return _collectionView;
}
- (WXQCustomLabelFlowLayout *)layout {
    if (!_layout) {
        _layout = [[WXQCustomLabelFlowLayout alloc]init];
        _layout.delegate = self;
    }
    return _layout;
}
#pragma mark - set方法设置属性
/// 设置背景颜色
- (void)setLabelFlowBgColor:(UIColor *)labelFlowBgColor {
    _labelFlowBgColor = labelFlowBgColor;
    self.collectionView.backgroundColor = labelFlowBgColor;
}
/// 设置单个标签背景色
- (void)setItemColor:(UIColor *)itemColor {
    _itemColor = itemColor;
    kWXQFlowConfig.itemColor = itemColor;
}
/// 设置标签字体颜色
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    kWXQFlowConfig.textColor = textColor;
}
/// 设置标签字体大小
- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    kWXQFlowConfig.textFont = textFont;
}
/// 设置标签整体距离四边的距离
- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    _contentInsets = contentInsets;
    kWXQFlowConfig.contentInsets = contentInsets;
}
/// 设置两个标签行之间的高度
- (void)setLineSpace:(CGFloat)lineSpace {
    _lineSpace = lineSpace;
    kWXQFlowConfig.lineSpace = lineSpace;
}
/// 设置标签高度
- (void)setItemHeight:(CGFloat)itemHeight {
    _itemHeight = itemHeight;
    kWXQFlowConfig.itemHeight = itemHeight;
}
/// 设置两个标签之间宽度
- (void)setItemSpace:(CGFloat)itemSpace {
    _itemSpace = itemSpace;
    kWXQFlowConfig.itemSpace = itemSpace;
}
/// 设置标签裁剪角度
- (void)setItemCornerRaius:(CGFloat)itemCornerRaius {
    _itemCornerRaius = itemCornerRaius;
    kWXQFlowConfig.itemCornerRaius = itemCornerRaius;
}
///设置文字两端边距
- (void)setTextEdge:(CGFloat)textEdge {
    _textEdge = textEdge;
    kWXQFlowConfig.textEdge = textEdge;
}
///设置边框宽度
- (void)setABorderWidth:(CGFloat)aBorderWidth {
    _aBorderWidth = aBorderWidth;
    kWXQFlowConfig.aBorderWidth = aBorderWidth;
}
///设置边框颜色
- (void)setABorderColor:(UIColor *)aBorderColor {
    _aBorderColor = aBorderColor;
    kWXQFlowConfig.aBorderColor = aBorderColor;
}
@end
