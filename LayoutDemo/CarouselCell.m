//
//  CarouselCell.m
//  LayoutDemo
//
//  Created by Haijiao on 15/7/24.
//  Copyright (c) 2015年 ttpod. All rights reserved.
//

#import "CarouselCell.h"

@implementation CarouselCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
