//
//  CarouselViewLayout.m
//  LayoutDemo
//
//  Created by Haijiao on 15/7/24.
//  Copyright (c) 2015年 ttpod. All rights reserved.
//

#import "CarouselViewLayout.h"

@interface CarouselViewLayout () {
    CGFloat height;
    CGSize  itemSize;
}

@end

@implementation CarouselViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    height = CGRectGetHeight(self.collectionView.frame);
    itemSize = CGSizeMake(320, 400);
    self.collectionView.contentInset = UIEdgeInsetsMake((height - itemSize.height) / 2, 0, (height - itemSize.height) / 2, 0);
}

- (CGSize)collectionViewContentSize {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), cellCount * itemSize.height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat centerY = self.collectionView.contentOffset.y + height / 2;
    NSInteger index = centerY / itemSize.height;
    NSInteger minIndex = MAX(0, (index - 2));
    NSInteger maxIndex = MIN((cellCount - 1), (index + 2));
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = minIndex; i <= maxIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = itemSize;
    
    CGFloat cY = self.collectionView.contentOffset.y + height / 2;
    CGFloat attributesY = itemSize.height * indexPath.row + itemSize.height / 2;
    attributes.zIndex = -ABS(attributesY - cY);
  
    CGFloat delta = cY - attributesY;
    CGFloat ratio =  - delta / (itemSize.height * 2);
    CGFloat scale = 1 - ABS(delta) / (itemSize.height * 6.0) * cos(ratio * M_PI_4);
    CGFloat centerX = CGRectGetWidth(self.collectionView.frame) / 2;
    CGFloat centerY = cY + sin(ratio * M_PI_2) * 100;
//    if (delta > 0 && delta <= itemSize.height / 2) {
//        CGRect rect = attributes.frame;
//        rect.origin.x = centerX - itemSize.width * scale / 2;
//        rect.origin.y = centerY - itemSize.height * scale / 2;
//        rect.size.width = itemSize.width * scale;
//        CGFloat param = delta / (itemSize.height / 2);
//        rect.size.height = itemSize.height * scale * (1 - param) + sin(0.25 * M_PI_2) * 100 * 2 * param;
//        attributes.frame = rect;
//    } else {
        attributes.transform3D = CATransform3DMakeScale(scale, scale, 1);
        attributes.center = CGPointMake(centerX, centerY);
//    }
    attributes.alpha = 1 - scale;
    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGPoint targetContentOffset = proposedContentOffset;
    CGFloat index = floorf((proposedContentOffset.y + height / 2 - itemSize.height / 2) / itemSize.height);
    index = MAX(0, index);
    targetContentOffset.y = itemSize.height * index + itemSize.height / 2 - height / 2;
    return targetContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}

@end
