//
//  SearchWebViewController.h
//  Automotive Headlines
//
//  Created by apple on 1/9/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
@interface SearchWebViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
}

- (instancetype)initWithLeftButtonWebUrl:(NSString *)leftUrl andCenterButtonUrl:(NSString *)centerUlr andRightButtonUrl:(NSString *)rightUrl;
- (void)hidesTabBar:(BOOL)hidden;
- (void)tableviewUpdataWithArr:(NSArray *)arr;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) Cell *cell;
@property (nonatomic,strong) UIWebView *webView;
@end
