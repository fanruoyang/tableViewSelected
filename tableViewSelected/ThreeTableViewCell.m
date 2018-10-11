//
//  ThreeTableViewCell.m
//  tableViewSelected
//
//  Created by ios on 2018/10/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ThreeTableViewCell.h"

@implementation ThreeTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ThreeTableViewCell";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[ThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setUI];
        
    }
    
    return cell;
    
}

-(void)setUI{
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 55)];
    self.label.font = [UIFont systemFontOfSize:17];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

@end
