//
//  CarouselCell.m
//  LayoutDemo
//
//  Created by Haijiao on 15/7/24.
//  Copyright (c) 2015年 ttpod. All rights reserved.
//

#import "CarouselCell.h"
#import "CarouselViewLayout.h"

@implementation CarouselCell

- (instancetype)initWithFrame:(CGRect)frame {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.maskView.alpha = layoutAttributes.alpha;
    self.alpha = 1.0f;
}

- (void)awakeFromNib {
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 4;
    self.layer.shadowOpacity = 0.3;
}

@end
