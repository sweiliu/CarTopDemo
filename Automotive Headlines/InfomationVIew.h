//
//  InfomationVIew.h
//  Automotive Headlines
//
//  Created by apple on 12/28/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageHeardView.h"
#import "ScrollHeardView.h"
#import "NavigationItemTitleView.h"

@interface InfomationVIew : UIViewController<UIScrollViewDelegate,NavigationItemTitleViewDelegate> {

    UIScrollView *_mainView;
    NavigationItemTitleView *_navigationItemTitleView;
    
}

@end
