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
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimLine];
            layout.visibleCount = 3;
            layout.itemSize = CGSizeMake(250, 250);
            break;
        case 1:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimCarousel];
            layout.itemSize = CGSizeMake(250, 250);
            break;
        case 2:
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimLine];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout.itemSize = CGSizeMake(250, 250);
            break;
        default:
            break;
    }
    
    CollectionViewController *vc = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Line";
            break;
        case 1:
            cell.textLabel.text = @"Carousel";
            break;
        default:
            cell.textLabel.text = @"Horizontal";
            break;
    }
    return cell;
}

@end
