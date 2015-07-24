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
    CGFloat halfHeiht;
}

@end

@implementation CarouselViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    height = CGRectGetHeight(self.collectionView.frame);
    halfHeiht = height / 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(halfHeiht - 150, 0, halfHeiht - 150, 0);
}

- (CGSize)collectionViewContentSize
{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), cellCount * 300);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(280, 300);
    CGFloat centerY = 150 + 300 * indexPath.row;
    attributes.center = CGPointMake(CGRectGetWidth(self.collectionView.frame) / 2, centerY);
    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGPoint targetContentOffset = proposedContentOffset;
    CGFloat index = floorf((proposedContentOffset.y - 150 + halfHeiht) / 300.0f);
    index = MAX(0, index);
    targetContentOffset.y = -halfHeiht + 150 + 300 * index;
    NSLog(@"%f", targetContentOffset.y);
    return targetContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}

@end
