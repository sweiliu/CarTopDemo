//
//  MainViewController.h
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "ImageHeardView.h"
#import "ScrollHeardView.h"
#import "LastImageHeardView.h"


@interface MainView : UIView<UITableViewDataSource,UITableViewDelegate> {

    UITableView *_tableView;
    
    NSMutableArray *_newsListData;
    
    NSMutableArray *_imageData;
    
    ImageHeardView *_imageView;
    
    ScrollHeardView *_scrollHeardView;
    
    LastImageHeatView *_lastImageHeardView;
}

@property (nonatomic, weak) UIViewController *pViewController;
@property (nonatomic, weak) UIViewController *tViewController;

- (void)tableViewSetHeardView:(int)tyleNum;

- (void)tableViewSetNewsListDataWithStr:(NSString *)newsListDataStr imageDateWithStr:(NSString *)imageDataStr;

@end

