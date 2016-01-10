//
//  SearchViewController.h
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewControllerCell.h"
@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{

    NSMutableArray *_searchResultsArr;
    NSArray *_dataArr;
    NSArray *_titleArr;
    
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,retain) UISearchDisplayController *searchDisplayController;
@end
