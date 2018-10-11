//
//  TwoTableViewController.m
//  tableViewSelected
//
//  Created by ios on 2018/10/9.
//  Copyright © 2018年 ios. All rights reserved.
//

/*
 cell 文本的展开 关闭
 1 在解析文本的时候就计算出文本的高度
 2 判断高度是否比约定高度高，如果高就展示按钮，如果没有，就隐藏按钮
 3 按钮的点击改变对应的高度。同时model里面默认一个Bool 值来记录是否展开的状态
 4 需要记住的一点，按钮的高度也需要加到cell 的高度上
 
 */
#import "TwoTableViewController.h"
#import "TwoModel.h"
#import "TwoTableViewCell.h"

@interface TwoTableViewController ()
@property (nonatomic ,strong) NSMutableArray *textArray;
#define FHRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]


@end

@implementation TwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textArray=[NSMutableArray array];
    [self initData];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
}


- (void)initData
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"TextInfo" ofType:@"json"];
    NSString *jsonContent=[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (jsonContent != nil)
    {
        NSData *jsonData = [jsonContent dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&err];
        NSArray *textList = [dic objectForKey:@"textList"];
        for (NSDictionary *dict in textList)
        {
            TwoModel *model = [[TwoModel alloc]initWithDict:dict];
            if (model)
            {
                [self.textArray addObject:model];
            }
        }
        
        if(err)
        {
            NSLog(@"json解析失败：%@",err);
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.textArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TwoModel *model=self.textArray[indexPath.row];
    
    if (model.height>100) {
        if (model.isShowMoreText==NO) {
         
            return 100;
            
        }else{
    
            return model.height+50;
        }
        
    }else{
        
    
        return  model.height+30;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TwoTableViewCell *cell=[TwoTableViewCell cellWithTableView:tableView IndexPath:indexPath];
     cell.backgroundColor=FHRandomColor;
    cell.model=self.textArray[indexPath.row];
   
    
    cell.selectedBlock = ^(UITableViewCell *cell) {
        
        [tableView beginUpdates];
        NSIndexPath *indexRow = [tableView indexPathForCell:cell];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexRow, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
    };
    
    return cell;
    
}

-(void)setTextArray:(NSMutableArray *)textArray{
    _textArray=textArray;
    
    
    [self.tableView reloadData];
    
}


@end
