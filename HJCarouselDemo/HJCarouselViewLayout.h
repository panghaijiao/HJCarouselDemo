//
//  HJCarouselViewLayout.h
//  HJCarouselDemo
//
//  Created by haijiao on 15/8/20.
//  Copyright (c) 2015年 olinone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HJCarouselAnim) {
    HJCarouselAnimDefault
};

@interface HJCarouselViewLayout : UICollectionViewLayout

- (instancetype)initWithAnim:(HJCarouselAnim)anim;

@property (nonatomic) BOOL pageEnable;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) NSInteger visibleCount;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

@end
