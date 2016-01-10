//
//  ChooseCarView.h
//  Automotive Headlines
//
//  Created by apple on 12/28/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"
#import "SearchViewControllerCell.h"
@interface ChooseCarView : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) CustomButton *testButton;

@end
