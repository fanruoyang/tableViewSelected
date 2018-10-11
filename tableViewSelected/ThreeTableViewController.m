//
//  ThreeTableViewController.m
//  tableViewSelected
//
//  Created by ios on 2018/10/10.
//  Copyright © 2018年 ios. All rights reserved.
//


/*
 多个cell，展开一个
 第一种：最简单方便，弄俩个cell，展开和收起的cell不同，根据点击状态展示不同的cell就可以
 第二种: 还没有想到
 
 */
#import "ThreeTableViewController.h"
#import "ThreeSelectedTableViewCell.h"
#import "ThreeTableViewCell.h"

#define FHRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
@interface ThreeTableViewController ()

@property (nonatomic, assign)BOOL isExpand; //判断当前cell是否展开
@property (nonatomic, strong)NSIndexPath *selectedIndexPath; //记录所点击的cell的位置

@property (nonatomic ,strong) NSArray *startArry;

@end

@implementation ThreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startArry = [NSArray arrayWithObjects:@"第一组",@"第二组",@"第三组",@"第四组", nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.startArry.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.selectedIndexPath.row && self.selectedIndexPath != nil ) {// 判断是否是所点击的cell
        if (self.isExpand == YES) { // 判断这个已点击的cell是否展开
            return 85;
        }else{
            return 55;
        }
    }else{
        return 55;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isExpand && [self.selectedIndexPath isEqual:indexPath]) {//如果展开并且是当前选中
        
        ThreeSelectedTableViewCell *cell=[ThreeSelectedTableViewCell cellWithTableView:tableView IndexPath:indexPath];
        cell.label.text=self.startArry[indexPath.row];
        cell.textString=self.startArry[indexPath.row];
        
        cell.backgroundColor=FHRandomColor;
        return cell;
        
    }else{
        ThreeTableViewCell *cell=[ThreeTableViewCell cellWithTableView:tableView IndexPath:indexPath];
        cell.label.text=self.startArry[indexPath.row];
          cell.textString=self.startArry[indexPath.row];
        
        cell.backgroundColor=FHRandomColor;
        return cell;
        
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!self.selectedIndexPath) {
        
        self.isExpand = YES;
        self.selectedIndexPath = indexPath;
        [self.tableView beginUpdates];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }else{
        
        if (self.isExpand) {
            if ([self.selectedIndexPath isEqual: indexPath]) {
                self.isExpand = NO;
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.tableView endUpdates];
                self.selectedIndexPath = nil;
                
            }else{
                [self.tableView beginUpdates];
                [self.tableView reloadRowsAtIndexPaths:@[self.selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                self.isExpand = YES ;
                self.selectedIndexPath = indexPath;
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [self.tableView endUpdates];
            }
        }
        
    }
}


@end
