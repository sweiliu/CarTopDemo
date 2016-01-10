//
//  Cell.m
//  Automotive Headlines
//
//  Created by apple on 1/4/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#define W_SIZE  [UIScreen mainScreen].bounds.size.width

#define H_SIZE   100.f


#import "Cell.h"

@implementation Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat wSize = [UIScreen mainScreen].bounds.size.width;

        
        self.photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 8, 120, 80)];
        [self.contentView addSubview:self.photoImage];
        
        self.classificationImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.classificationImage];
        
        self.commentsLable = [[UILabel alloc]init];
        self.commentsLable.font = [UIFont systemFontOfSize:11];
        self.commentsLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.commentsLable];
        
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(140, 12, wSize-140-15, 35)];
        self.titleLable.font = [UIFont systemFontOfSize:14];
        self.titleLable.numberOfLines = 2;
        [self.contentView addSubview:self.titleLable];
        
        self.sourceLable = [[UILabel alloc] init];
        self.sourceLable.font = [UIFont systemFontOfSize:11];
        self.sourceLable.textColor = [UIColor redColor];
        self.sourceLable.frame = CGRectMake(140, 75, 0, 0);
        self.releaseTimeLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.sourceLable];
        
        self.releaseTimeLable = [[UILabel alloc]init];
        self.releaseTimeLable.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.releaseTimeLable];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToWeb)];
        [self.contentView addGestureRecognizer:tapGesture];
        
        
    }
    return self;
}
- (void)goToWeb{

    NSLog(@"点击了cell");
    
    WebViewControllers *webViewControllers = [[WebViewControllers alloc]initWithWebUrl:_webUrlStr andBodyStr:nil];
    
    [_viewControllersWebView.navigationController pushViewController:webViewControllers animated:YES];

}

- (void)updateWithDic:(NSDictionary *)dic{

    if (!dic) {
        return;
    }
    
    NSURLRequest *mainImageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dic[@"picUrlList"][0]]]];
    [NSURLConnection sendAsynchronousRequest:mainImageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        [_photoImage setImage:[UIImage imageWithData:data]];
        
    }];
    
    _titleLable.text = dic[@"title"];
    _webUrlStr =dic[@"resourceLoc"];
    _sourceLable.text = dic[@"origin"];
    CGSize size = [_sourceLable.text sizeWithFont:_sourceLable.font constrainedToSize:CGSizeMake(200, 50) lineBreakMode:UILineBreakModeCharacterWrap];
    [_sourceLable setFrame:CGRectMake(140, 75, size.width, 10)];
    [_releaseTimeLable setFrame:CGRectMake(140+10+size.width, 75, 48, 10)];
    
    _releaseTimeLable.text = dic[@"publishTime"];

    
    NSString *str = dic[@"articleType"];
//    NSLog(@"_classification style = %@",str);
    int style = [str intValue];
    
    
    
    if (style != 0) {
        switch (style) {
            case 1:
                [_classificationImage setImage:[UIImage imageNamed:@"hot_title"]];
                
                break;
                
            case 2:
                [_classificationImage setImage:[UIImage imageNamed:@"yc"]];
                
                break;
                
            case 3:
                [_classificationImage setImage:[UIImage imageNamed:@"tg"]];
                
                break;
                
            case 6:
                [_classificationImage setImage:[UIImage imageNamed:@"tt"]];
                
                break;
                
            default:
                [_classificationImage setImage:nil];
                break;
        }
    
        [_classificationImage sizeToFit];
        
        CGSize classificationImageSize = _classificationImage.frame.size;
        _classificationImage.frame = CGRectMake(W_SIZE-10-classificationImageSize.width, 73, classificationImageSize.width, classificationImageSize.height);
//        CGRect classificationRect = _classificationImage.frame;

    }else{
    
        _classificationImage.frame = CGRectZero;
    }
    
    
    
    NSString *comments = dic[@"CommuntCount"];
//    NSLog(@"%@",comments);
    
    int commetsCount = [comments intValue];

    NSString *commentsStr = [NSString stringWithFormat:@"评论(%i)",commetsCount];
    
    CGSize commentLabelSize = [commentsStr sizeWithFont:_commentsLable.font constrainedToSize:CGSizeMake(200, 50) lineBreakMode:UILineBreakModeCharacterWrap];
    if (commetsCount != 0 && style != 0) {
        
        [_commentsLable setFrame:CGRectMake(_classificationImage.frame.origin.x-10-commentLabelSize.width, 75, commentLabelSize.width, commentLabelSize.height)];
        _commentsLable.text = commentsStr;
//        CGRect rect = _commentsLable.frame;
    }else if (commetsCount != 0 ){
        
        [_commentsLable setFrame:CGRectMake(W_SIZE-10-commentLabelSize.width, 75, commentLabelSize.width, commentLabelSize.height)];
    _commentsLable.text = commentsStr;
    
    }else{
        _commentsLable.frame = CGRectZero;
        _commentsLable.text = nil;
    }
    
}

@end
