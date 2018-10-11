//
//  ThreeSelectedTableViewCell.h
//  tableViewSelected
//
//  Created by ios on 2018/10/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeSelectedTableViewCell : UITableViewCell


@property (strong, nonatomic)UILabel *label;
@property (nonatomic ,strong) UIButton *button;

@property (nonatomic ,strong) NSString *textString;

+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;

@end
