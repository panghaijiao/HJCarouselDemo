//
//  MenuTableViewController.m
//  HJCarouselDemo
//
//  Created by haijiao on 15/8/20.
//  Copyright (c) 2015年 olinone. All rights reserved.
//

#import "MenuTableViewController.h"
#import "CollectionViewController.h"
#import "HJCarouselViewLayout.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"olinone";
    self.tableView.rowHeight = 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HJCarouselViewLayout *layout = nil;
    switch (indexPath.row) {
        case 0:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimLinear];
            layout.visibleCount = 3;
            break;
        case 1:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimRotary];
            break;
        case 2:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimCarousel];
            break;
        case 3:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimCarousel1];
            break;
        case 4:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimCoverFlow];
            break;
        default:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimLinear];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            break;
    }

    layout.itemSize = CGSizeMake(250, 250);
    CollectionViewController *vc = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    vc.title = cell.textLabel.text;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Linear";
            break;
        case 1:
            cell.textLabel.text = @"Rotary";
            break;
        case 2:
            cell.textLabel.text = @"Carousel";
            break;
        case 3:
            cell.textLabel.text = @"Carousel1";
            break;
        case 4:
            cell.textLabel.text = @"CoverFlow";
            break;
        default:
            cell.textLabel.text = @"Horizontal";
            break;
    }
    return cell;
}

@end
