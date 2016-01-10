//
//  InfomationVIew.m
//  Automotive Headlines
//
//  Created by apple on 12/28/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "InfomationVIew.h"
#import "MainView.h"
#define NUM 9
#define W_SIZE [UIScreen mainScreen].bounds.size.width
#define H_SIZE [UIScreen mainScreen].bounds.size.height
#define STATUS_Y 20
//
//
//
//@interface InfomationVIew ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate, ScorllImageViewDelegate, InfomationHearViewDelegate>
//{
//
//    ScorllImageView *_scrollImageView00;
//    
//    NSArray *_imgArr;
//    
//    NSDictionary *imageDic;
//    
//    UIImageView *_imageView00;
//    UIImageView *_imageView01;
//    UIImageView *_imageView02;
//    UIImageView *_imageView03;
//    UIImageView *_imageView04;
//    UIImageView *_imageView05;
//    
//    ViewControllers *_viewController01;
//    ViewControllers *_viewController02;
//    ViewControllers *_viewController03;
//    ViewControllers *_viewController04;
//    ViewControllers *_viewController05;
//    
//    UIImageView *_adversitementImageView;
//    
//    NSMutableArray *_dataArr;
//    
//    NSMutableArray *_viewsData;
//    
//    NSMutableURLRequest *_viewControllersRequest;
//    
//    NSString *_urlStr;
//    
//    InfomationHearView *_navigatonHeardView;
//}
//@property (nonatomic,strong) UITableView *mytableView;
//@property (nonatomic,strong) UIScrollView *scrollView;
//@property (nonatomic,strong) UIScrollView *scollImageView;
//@property (nonatomic,strong) UILabel *titleLable;
////
//@end

@implementation InfomationVIew

- (void)viewWillAppear:(BOOL)animated {

    
}

-(void)viewDidLoad{

    [super viewDidLoad];
    
    UIScrollView *mainView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, W_SIZE, H_SIZE)];
    [self.view addSubview:mainView];
    mainView.delegate = self;
    mainView.pagingEnabled = YES;
    mainView.contentSize = CGSizeMake(6*W_SIZE, 0);
    mainView.contentOffset = CGPointMake(0, 0);
    _mainView = mainView;

    
    
    //导航栏设置
    NavigationItemTitleView *navigationTitleView = [[NavigationItemTitleView alloc]initWithFrame:CGRectMake(0, 0, W_SIZE, 44)];
    self.navigationItem.titleView = navigationTitleView;
    self.navigationController.navigationBar.barTintColor = [UIColor groupTableViewBackgroundColor];
    navigationTitleView.delegate = self;
    _navigationItemTitleView = navigationTitleView;
    navigationTitleView.pViewController = self;
    
    
    MainView *firstView = [[MainView alloc]initWithFrame:CGRectMake(0, 0, W_SIZE, H_SIZE)];
    [firstView tableViewSetNewsListDataWithStr:@"page=0&classId=0" imageDateWithStr:@"region=%E5%8C%97%E4%BA%AC&classId=0"];
    firstView.pViewController = self;
    [firstView tableViewSetHeardView:200];
    [mainView addSubview:firstView];

    [self addViews];
    
}

- (void)addViews {
    
    NSArray *arr = @[@{@"newsListData":@"page=0&classId=0",@"imageData":@"region=%E5%8C%97%E4%BA%AC&classId=0"},
                     @{@"newsListData":@"page=0&classId=1",@"imageData":@"region=%E5%8C%97%E4%BA%AC&classId=1"},
                     @{@"newsListData":@"page=0&classId=2",@"imageData":@"region=%E5%8C%97%E4%BA%AC&classId=2"},
                     @{@"newsListData":@"page=0&classId=3",@"imageData":@"region=%E5%8C%97%E4%BA%AC&classId=3"},
                     @{@"newsListData":@"page=0&classId=30",@"imageData":@"region=%E5%8C%97%E4%BA%AC&classId=30"},
                     @{@"newsListData":@"page=0&classId=4",@"imageData":@"region=%E5%8C%97%E4%BA%AC&classId=4"}];
    CGFloat x = W_SIZE;
    for (NSInteger index = 2; index < 7; index++) {
        MainView *view = [[MainView alloc]initWithFrame:CGRectMake(x, 0, W_SIZE, H_SIZE)];
        [_mainView addSubview:view];
        view.pViewController = self;
        view.tag = index-1;
        [view tableViewSetNewsListDataWithStr:arr[index-1][@"newsListData"] imageDateWithStr:arr[index-1][@"imageData"]];
        [view tableViewSetHeardView:100];
        x = W_SIZE*index;
    }
    
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    NSInteger index = scrollView.contentOffset.x/W_SIZE;
    NSLog(@"%lu",index);
}

- (void)setViewData {

}


#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger num = (NSInteger)scrollView.contentOffset.x/W_SIZE;
    
    [_navigationItemTitleView updateTapBtn:num];
 
}


#pragma mark - ScorllImageViewDelegate
- (void)goToWebFromScrollImgV:(NSString *)url {
    
    WebViewControllers *webViewControllers = [[WebViewControllers alloc]initWithWebUrl:nil andBodyStr:url];
    
    [self.navigationController pushViewController:webViewControllers animated:YES];
}

#pragma mark - InfomationHearViewDelegate
- (void)tapBtn:(NSInteger)idx {
    [_mainView setContentOffset:CGPointMake(idx * _mainView.frame.size.width, 0) animated:YES];
}

@end
