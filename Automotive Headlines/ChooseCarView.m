//
//  ChooseCarView.m
//  Automotive Headlines
//
//  Created by apple on 12/28/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#define SIZE_VIEW [UIScreen mainScreen].bounds.size

#import "ChooseCarView.h"


@implementation ChooseCarView
{

    NSArray *_dataArr;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    
    _dataArr = @[
                 @{@"leftImg":@"tougao1 copy",@"centerImg":@"tougao1 copy",@"rightImg":@"",@"underlineImg":@"tougao1 copy",@"leftTitle":@"选题会",@"centerTitle":@"头条客",@"rightTitle":@"投稿", @"leftButtonUrl":@"http://m.qctt.cn/ttk/index",@"centerButtonUrl":@"http://m.qctt.cn/index/TtkAuthor",@"rightButton":@"http://m.qctt.cn/index/login"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"五问速读",@"centerTitle":@"头条图说",@"rightTitle":@"头条解析", @"leftButtonUrl":@"407",@"centerButtonUrl":@"408",@"rightButton":@"4010"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"头条眼",@"centerTitle":@"头条数据",@"rightTitle":@"头条看板", @"leftButtonUrl":@"4012",@"centerButtonUrl":@"4013",@"rightButton":@"4016"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"头条试驾",@"centerTitle":@"值不值得等",@"rightTitle":@"", @"leftButtonUrl":@"4017",@"centerButtonUrl":@"",@"rightButton":@"4019"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"修车坑不到",@"centerTitle":@"用车有B格",@"rightTitle":@"老司机支招", @"leftButtonUrl":@"4031",@"centerButtonUrl":@"4032",@"rightButton":@"4033"}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SearchViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SearchViewControllerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.leftButton.tag = indexPath.row+1;
    NSInteger tag = cell.leftButton.tag;
    NSLog(@"%lu",cell.leftButton.tag);

    [cell updateWithDic:_dataArr[indexPath.section]];
    [tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    cell.selectionStyle=UITableViewCellAccessoryNone;
    return cell;
}

-(void)initData
{
//    NSURLRequest *request  = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/Adverqctt/getFocus"]];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        if (connectionError) {
//            return;
//        }
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSArray *arr = dic[@"data"][@"focusList"];
//        
//        ImageViews *imageViews = [self.view viewWithTag:999];
//        [imageViews updateWithArr:arr];
//        
//    }];
}

@end
