//
//  TwoTableViewCell.h
//  tableViewSelected
//
//  Created by ios on 2018/10/9.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoModel.h"

@interface TwoTableViewCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;


@property (nonatomic ,strong) UILabel *textTitleLabel;
@property (nonatomic ,strong) UILabel *textContentLabel;
@property (nonatomic ,strong) UIButton *moreButton;

@property (nonatomic ,copy) void (^selectedBlock)(UITableViewCell *cell);

@property (nonatomic ,strong) TwoModel *model;

@end
