//
//  ViewControllersCell.m
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "ViewControllersCell.h"

@interface ViewControllersCell()

@property (nonatomic,strong) UIImageView *mainImage;
@property (nonatomic,strong) UIImageView *classifictionImage;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *sourceLabel;
@property (nonatomic,strong) UILabel *commentsCountLabel;
@property (nonatomic,strong) UIWebView *webView;

@end
@implementation ViewControllersCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat wSize = [UIScreen mainScreen].bounds.size.width;
        CGFloat hSize = 75.f;
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, wSize, hSize)];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(goToWeb:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
        //主要图片
        self.mainImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 90, 60)];
        [self.contentView addSubview:self.mainImage];
        
        //分类图片
        self.classifictionImage = [[UIImageView alloc]initWithFrame:CGRectMake(wSize-27, hSize-22, 20, 12)];
        [self.contentView addSubview:self.classifictionImage];
        
        //标题
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(109, 10, 230, 40)];
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.font = [UIFont systemFontOfSize:16.0];
        self.titleLabel.numberOfLines = 2;

        
        //来源
        self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(109, hSize-30, 40, 10)];
        [self.contentView addSubview:self.sourceLabel];
        self.sourceLabel.font = [UIFont systemFontOfSize:12];
        self.sourceLabel.textColor = [UIColor redColor];
        
        //时间
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(149+9, hSize-30, 40, 10)];
        [self.contentView addSubview:self.timeLabel];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor grayColor];
        
        //评论次数
        self.commentsCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(wSize-self.classifictionImage.frame.origin.x-self.classifictionImage.frame.size.width-11, hSize-30, 50, 10)];
        [self.contentView addSubview:self.commentsCountLabel];
        self.commentsCountLabel.font = [UIFont systemFontOfSize:12];
        self.commentsCountLabel.textColor = [UIColor grayColor];
    }
    return self;
}

-(void)updateWithDic:(NSDictionary *)dic{

    if (!dic) {
        return;
    }
    
    //主要图片
    NSURLRequest *mainImageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dic[@"picUrlList"][0]]]];
    [NSURLConnection sendAsynchronousRequest:mainImageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        [_mainImage setImage:[UIImage imageWithData:data]];
        
    }];
    
    _titleLabel.text = dic[@"title"];
    _timeLabel.text = dic[@"publishTime"];
    _commentsCountLabel.text = dic[@"CommuntCount"];
    _sourceLabel.text = dic[@"origin"];
    _webUrl =dic[@"resourceLoc"];
}

- (void)goToWeb:(UIButton *)button{
    
//    self.webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
//    NSMutableURLRequest *webRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://m.autodatalive.com/html/mobile/news_new/showapi5-%@.html",_webUrl]]];
//    [self.webView loadRequest:webRequest];
    
//    WebViewController *vc = [[WebViewController alloc] initWithUrl:[NSString stringWithFormat:@"http://m.autodatalive.com/html/mobile/news_new/showapi5-%@.html",_webUrl]];
//    [self.pViewController.navigationController pushViewController:vc animated:YES];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://m.autodatalive.com/html/mobile/news_new/showapi5-%@.html", _webUrl];
//    if (self.delegate && [self.delegate respondsToSelector:@selector(goToWebUrl:)]) {
//        [self.delegate goToWebUrl:urlStr];
//    }
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoweburl" object:urlStr userInfo:nil];
    
    if (self.goToWebBlock) {
        self.goToWebBlock(urlStr);
    }
}
@end
