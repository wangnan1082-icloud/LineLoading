//
//  UIView+LineLoading.h
//  LineLoading
//
//  Created by 王楠 on 2018/12/5.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LineLoading)

@property (nonatomic, strong) UIColor *lineColor; /**< 线颜色*/
@property (nonatomic, assign) CGFloat lineWidth; /**< 线宽*/

- (void)startLoading;
- (void)stopLoading;

@end

NS_ASSUME_NONNULL_END
