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
            layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimDefault];
            layout.itemSize = CGSizeMake(250, 250);
            break;
        default:
            break;
    }
    
    CollectionViewController *vc = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Vertical";
    } else {
        cell.textLabel.text = @"Horizontal";
    }
    return cell;
}

@end
