//
//  TableViewController.m
//  tableViewSelected
//
//  Created by ios on 2018/10/8.
//  Copyright © 2018年 ios. All rights reserved.
//


#import "TableViewController.h"
#import "OneTableViewController.h"
#import "TwoTableViewController.h"
#import "ThreeTableViewController.h"
#import "FourTableViewController.h"
#import "FiveTableViewController.h"

@interface TableViewController ()

@property (strong ,nonatomic) NSArray *startArry;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.startArry=[NSArray arrayWithObjects:@"一组cell 里面 如果有超过2个cell。就展示更多按钮",@"cell 文本的展开 关闭",@"多个cell，展开一个",@"书签章节f'f学习",@"qq组的展开关闭", nil];
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    static NSString *ID = @"NLChooseTableViewCell";
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text=self.startArry[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            OneTableViewController *oneVC=[OneTableViewController new];
            
            [self.navigationController pushViewController:oneVC animated:YES];
        }
            break;
            
        case 1:
        {
            TwoTableViewController *oneVC=[TwoTableViewController new];
            
            [self.navigationController pushViewController:oneVC animated:YES];
        }
            break;
        case 2:
        {
            ThreeTableViewController *oneVC=[ThreeTableViewController new];
            
            [self.navigationController pushViewController:oneVC animated:YES];
        }
            break;
        case 3:
        {
            FourTableViewController *oneVC=[FourTableViewController new];
            
            [self.navigationController pushViewController:oneVC animated:YES];
        }
            break;
        case 4:
        {
            FiveTableViewController *oneVC=[FiveTableViewController new];
            
            [self.navigationController pushViewController:oneVC animated:YES];
        }
            break;
        default:
            break;
    }
    
    
}

@end
