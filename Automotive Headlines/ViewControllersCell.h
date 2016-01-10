//
//  ViewControllersCell.h
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllersCellDelegate <NSObject>

- (void)goToWebUrl:(NSString *)webUrl;

@end


@interface ViewControllersCell : UITableViewCell
{
    NSMutableString *_webUrl;
}

//@property (nonatomic, weak) UIViewController *pViewController;

@property (nonatomic, weak) id<ViewControllersCellDelegate> delegate;

@property (nonatomic, copy) void(^goToWebBlock)(NSString *urlStr);

-(void)updateWithDic:(NSDictionary *)dic;

@end
