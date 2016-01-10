//
//  ChoicCell.h
//  Automotive Headlines
//
//  Created by apple on 12/30/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WebViewControllers.h"
#import "ChoiceView.h"
@interface ChoicCell : UITableViewCell
{
    NSString *_webUrlStr;
}

@property (nonatomic,weak) ChoiceView *webView;
@property (nonatomic,strong) UIImageView *photoImg;//主图片
@property (nonatomic,strong) UILabel *timeLable;//发布时间
@property (nonatomic,strong) UIImageView *classificationImg;//分类图片
@property (nonatomic,strong) UILabel *descriptionLable;//描述
@property (nonatomic,strong) UILabel *titleLable;//标题

-(void)initData:(NSDictionary *)dic;
@end
