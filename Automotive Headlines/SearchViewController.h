//
//  SearchViewController.h
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewControllerCell.h"
#import "Cell.h"
@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>
{

    NSMutableArray *_searchArr;
    NSArray *_dataArr;
    NSArray *_titleArr;
    
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchController *searchController;

@end
