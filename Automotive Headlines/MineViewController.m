//
//  MineViewController.m
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "MineViewController.h"
#import "TableHeardView.h"
#import "MineViewControllerCell.h"
#import "MBProgressHUD.h"
@interface MineViewController()<UITableViewDataSource,UITableViewDelegate,tableHeatdViewDelegate>
{
    NSArray *_arr00;
    NSDictionary *_dic00;
    NSDictionary *_dic01;
    NSArray *_arr01;

}
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSArray *DataArr;


@end

@implementation MineViewController

- (void)viewDidAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewDidLoad{

    [super viewDidLoad];
    
    CGFloat wSize = [UIScreen mainScreen].bounds.size.width;
    CGFloat hSize = [UIScreen mainScreen].bounds.size.height;
    
    
    self.myTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.myTableView];
    self.myTableView.delegate = self;
    self.myTableView.dataSource =self;
    [self.view addSubview:self.myTableView];
    self.myTableView.showsVerticalScrollIndicator = NO;
    
    UIButton *signInButton = [[UIButton alloc]initWithFrame:CGRectMake(wSize-45, hSize-100, 40, 40)];
    [signInButton setTitle:@"签到" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:signInButton];
    
    TableHeardView *heardView = [[TableHeardView alloc]initWithFrame:CGRectMake(0, 0, wSize, 260)];
    self.myTableView.tableHeaderView = heardView;
    heardView.pViewController = self;
    heardView.delegate = self;

    
    

    [self initData];
}

- (void)initData{
    
    _DataArr =@[@[@{@"img":@"my_gold",@"title":@"我的金币"},
                  @{@"img":@"gold_task",@"title":@"金币任务"}],
                @[@{@"img":@"tougao",@"title":@"投稿"}],
                @[@{@"img":@"qingchu",@"title":@"清除缓存"}],
                @[@{@"img":@"aboutus",@"title":@"关于我们"},
                  @{@"img":@"fankui",@"title":@"意见反馈"},
                  @{@"img":@"shengming",@"title":@"免责声明"}]];
    
    [self.myTableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _DataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *arr = _DataArr[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MineViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MineViewControllerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray *arr = _DataArr[indexPath.section];
    [cell updateWithDic:arr[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 45.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10.f;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger section = indexPath.section;
    

    NSLog(@"点击了第%lu组的第%lu行",section);
}

#pragma mark = TableHeardViewDelegate

- (void)shallowLable:(BOOL)BL {

    if (BL == YES) {
        MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithFrame:CGRectMake(90, 200, 80, 20)];
        [self.view addSubview:HUD];
        HUD.mode = MBProgressHUDModeText;
        HUD.labelText = @"还记得";
        [HUD showAnimated:YES whileExecutingBlock:^{
            sleep(3);
        } completionBlock:^{
            [HUD removeFromSuperview];
            NSLog( @"这玩意毁了");
        }];
    }
}
@end
