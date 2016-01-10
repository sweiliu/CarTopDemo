//
//  ChoicCell.m
//  Automotive Headlines
//
//  Created by apple on 12/30/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ChoicCell.h"

@implementation ChoicCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGSize wSize = [UIScreen mainScreen].bounds.size;


        UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, wSize.width-20, 310)];
        mainView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:mainView];
        
        self.photoImg = [[UIImageView alloc]initWithFrame:CGRectMake(4, 10, mainView.frame.size.width-8, 200)];
        [mainView addSubview:self.photoImg];
        
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, mainView.frame.size.width-20, 18)];
        [mainView addSubview:self.titleLable];
        
        self.descriptionLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 220+18+12, mainView.frame.size.width-20, 35)];
        self.descriptionLable.numberOfLines = 2;
        self.descriptionLable.font = [UIFont systemFontOfSize:14];
        self.descriptionLable.textColor = [UIColor grayColor];
        [mainView addSubview:self.descriptionLable];
        
        self.timeLable = [[UILabel alloc]initWithFrame:CGRectMake(10, self.descriptionLable.frame.origin.y+35+5, 34, 16)];
        self.timeLable.font = [UIFont systemFontOfSize:11];
        self.timeLable.textColor = [UIColor grayColor];
        [mainView addSubview:self.timeLable];
        
        self.classificationImg = [[UIImageView alloc]initWithFrame:CGRectMake(mainView.frame.size.width-30, self.descriptionLable.frame.origin.y+35+3, 26, 16)];
        [mainView addSubview:self.classificationImg];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoWeb)];
        [self.contentView addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)gotoWeb {

    NSString *str = [NSString stringWithFormat:@"http://m.autodatalive.com/html/mobile/news_new/showapi5-%@.html",_webUrlStr];
    
    WebViewControllers *web = [[WebViewControllers alloc]initWithWebUrl:nil andBodyStr:str];
    [self.webView.navigationController pushViewController:web animated:YES];
}

-(void)initData:(NSDictionary *)dic
{
    if (!dic) {
        return;
    }
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dic[@"picUrl"]]]];
    
    [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        UIImage *img = [UIImage imageWithData:data];
        [_photoImg setImage:img];
    }];
    _titleLable.text = dic[@"title"];
    
    _webUrlStr = dic[@"resourceLoc"];
    
    _descriptionLable.text = dic[@"excerpt"];

    _timeLable.text = dic[@"publishTime"];
    
    NSString *str = dic[@"articleType"];
    int i = [str intValue];
    switch (i) {
        case 1:
            [_classificationImg setImage:[UIImage imageNamed:@"hot_title"]];
            break;
        case 2:
            [_classificationImg setImage:[UIImage imageNamed:@"yc"]];
            break;
        default:
            [_classificationImg setImage:[UIImage imageNamed:@"zt"]];
            break;
    }
    
}
@end
