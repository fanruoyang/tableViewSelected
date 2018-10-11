//
//  OneTableViewController.m
//  tableViewSelected
//
//  Created by ios on 2018/10/8.
//  Copyright © 2018年 ios. All rights reserved.
//


//场景。一组cell 里面 如果有超过2个cell。就展示更多按钮，点击展开剩余的，如果没有有2个就展示2个，没有按钮
//footerView 上面加一个按钮做动画
//存在一个bool 判断是否展开
//
#import "OneTableViewController.h"

@interface OneTableViewController ()

@property (strong ,nonatomic) NSArray *startArry;
@property (assign ,nonatomic) BOOL isOpen;


@end

@implementation OneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startArry = [NSArray arrayWithObjects:@"第一组",@"第二组",@"第三组",@"第四组", nil];
    self.isOpen = NO;
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (self.startArry.count>2) {
            if (_isOpen==YES) {
                return self.startArry.count;
            }else{
                return 2;
            }
        }else{
            
            return  self.startArry.count;
        }
    }else{
        return 0;
    }

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section==0) {
        return 0;
    }else{
        
        if (self.startArry.count >2) {
            
            return 30;
        }else{
            
            return 0;
        }
    }

    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section==0) {
        return nil;
    }else{
        
        UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        footView.backgroundColor=[UIColor blueColor];
        footView.userInteractionEnabled=YES;
        
        UIButton *openButton =[[UIButton alloc]initWithFrame:CGRectMake(200, 0, 100, 30)];
        
        openButton.backgroundColor=[UIColor redColor];
        
        [openButton setTitle:@"da'kai"forState:UIControlStateNormal];
        [openButton setTitle:@"关闭"forState:UIControlStateSelected];
        
        [openButton addTarget:self action:@selector(open:) forControlEvents:UIControlEventTouchUpInside];
        openButton.userInteractionEnabled=YES;
        
        [footView addSubview:openButton];
        
        return footView;
    }

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    static NSString *ID = @"NLChooseTableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text=self.startArry[indexPath.row];
    
    return cell;
}




- (void)open:(UIButton *)sender{
    
   sender.selected=!sender.selected;
    NSLog(@"打开");
    
    _isOpen=sender.selected;

    NSIndexSet * nd=[[NSIndexSet alloc]initWithIndex:0];
    [self.tableView reloadSections:nd withRowAnimation:UITableViewRowAnimationAutomatic];
    


}

@end
