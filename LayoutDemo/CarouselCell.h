//
//  CarouselCell.h
//  LayoutDemo
//
//  Created by Haijiao on 15/7/24.
//  Copyright (c) 2015年 ttpod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarouselCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIView      *maskView;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel     *lblView;

@end
