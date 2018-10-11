//
//  ThreeSelectedTableViewCell.m
//  tableViewSelected
//
//  Created by ios on 2018/10/10.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ThreeSelectedTableViewCell.h"

@implementation ThreeSelectedTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ThreeSelectedTableViewCell";
    ThreeSelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[ThreeSelectedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setUI];

    }
  
    
    return cell;
    
}


- (void)setUI{
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 55)];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:17];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 55, self.frame.size.width, 30)];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    self.button=button;
    [self addSubview:self.button];
    
}
- (void)button:(UIButton *)sender{

    NSLog(@"点击代理%@",self.textString);
}


@end
