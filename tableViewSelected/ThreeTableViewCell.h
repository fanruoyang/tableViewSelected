//
//  ThreeTableViewCell.h
//  tableViewSelected
//
//  Created by ios on 2018/10/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;

@property (strong, nonatomic)UILabel *label;

@property (nonatomic ,strong) NSString *textString;
@end
