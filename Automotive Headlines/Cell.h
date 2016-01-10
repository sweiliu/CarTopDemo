//
//  Cell.h
//  Automotive Headlines
//
//  Created by apple on 1/4/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewControllers.h"


@interface Cell : UITableViewCell
{
    NSMutableString *_commentsLableTxt;
    NSString *_webUrlStr;

}

@property (nonatomic,copy) void(^gotoWebBlock)(NSString *str);
@property (nonatomic,retain) UIViewController *viewControllersWebView;
@property (nonatomic,strong) UIImageView *photoImage;//主要图片
@property (nonatomic,strong) UIImageView *classificationImage;//分类图片
@property (nonatomic,strong) UILabel *titleLable;//标题
@property (nonatomic,strong) UILabel *sourceLable;//来源
@property (nonatomic,strong) UILabel *releaseTimeLable;//发布时间
@property (nonatomic,strong) UILabel *commentsLable;//评论次数


- (void)updateWithDic:(NSDictionary *)dic;

@end
