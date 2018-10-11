//
//  TwoTableViewCell.m
//  tableViewSelected
//
//  Created by ios on 2018/10/9.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "TwoTableViewCell.h"

@implementation TwoTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"TwoTableViewCell";
    TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[TwoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell setUI];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    return cell;
    
}


-(void)setUI{
    
    _textTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 140, 20)];
    _textTitleLabel.textColor = [UIColor blackColor];
    _textTitleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:_textTitleLabel];
    
    _textContentLabel = [[UILabel alloc]init];
    _textContentLabel.textColor = [UIColor blackColor];
    _textContentLabel.font = [UIFont systemFontOfSize:16];
    _textContentLabel.numberOfLines = 0;
    [self addSubview:_textContentLabel];
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreButton setTitle:@"显示" forState:UIControlStateNormal];
    [_moreButton setTitle:@"关闭" forState:UIControlStateSelected];
    [_moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_moreButton];
    [_moreButton addTarget:self action:@selector(showMoreText:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)showMoreText:(UIButton *)sender{
    self.model.isShowMoreText = !self.model.isShowMoreText;
    if (_selectedBlock) {
        _selectedBlock(self);
    }
}


-(void)setModel:(TwoModel *)model{
    _model=model;
    
    _moreButton.selected=model.isShowMoreText;
    
    _textTitleLabel.text=model.textName;
    _textContentLabel.text=model.textContent;
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (_model.height>100) {
        [_moreButton setFrame:CGRectMake(15, self.frame.size.height-20, [UIScreen mainScreen].bounds.size.width - 30,20)];
    }
    [_textContentLabel setFrame:CGRectMake(15, 30, [UIScreen mainScreen].bounds.size.width - 30,self.frame.size.height-30-_moreButton.frame.size.height)];
    
}


@end
