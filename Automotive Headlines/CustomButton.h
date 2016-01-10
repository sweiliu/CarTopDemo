//
//  CustomButton.h
//  Automotive Headlines
//
//  Created by apple on 1/4/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect;
- (CGRect)imageRectForContentRect:(CGRect)contentRect;

@end
