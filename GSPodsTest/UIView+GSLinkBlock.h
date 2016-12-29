//
//  UIView+GSLinkBlock.h
//  GSLinkBlockDemo
//
//  Created by Mars Gao on 2016/11/24.
//  Copyright © 2016年 Mars Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GSLinkBlock)
+ (instancetype)gs_labelinitWith:(void(^)(UIView *view))mark;
@property(nonatomic,copy,readonly)UIView *(^gs_viewFrame)(CGRect frame);

@property(nonatomic,copy,readonly)UIView *(^gs_backgroundColor)(UIColor *color);
/**
 随即色
 */
@property(nonatomic,copy,readonly)UIView *(^gs_viewBackgroundColorRandom)();



/**
 获取x,y,w,h
 */
@property (nonatomic,copy,readonly)CGFloat (^gs_viewX)();
@property (nonatomic,copy,readonly)CGFloat (^gs_viewY)();
@property (nonatomic,copy,readonly)CGFloat (^gs_viewWidth)();
@property (nonatomic,copy,readonly)CGFloat (^gs_viewHeight)();
@property (nonatomic,copy,readonly)CGFloat (^gs_viewCenterX)();
@property (nonatomic,copy,readonly)CGFloat (^gs_viewCenterY)();

/**
 设置x,y,w,h
 */
@property (nonatomic,copy,readonly)UIView *(^gs_setViewX)(CGFloat);
@property (nonatomic,copy,readonly)UIView *(^gs_setViewY)(CGFloat);
@property (nonatomic,copy,readonly)UIView *(^gs_setViewWidth)(CGFloat);
@property (nonatomic,copy,readonly)UIView *(^gs_setViewHeight)(CGFloat);


/**
 设置 layer
 */
//
@property (nonatomic,copy,readonly)UIView *(^gs_viewCornerRadius)(CGFloat);
@property (nonatomic,copy,readonly)UIView *(^gs_viewMasksToBounds)(BOOL);
@property (nonatomic,copy,readonly)UIView *(^gs_viewHidden)(BOOL);


/**
 firstResponder
 */
@property (nonatomic,copy,readonly)UIView *(^gs_viewEndEditing)(BOOL force);
@property (nonatomic,copy,readonly)UIView *(^gs_viewBecomeFirstResponder)();
@property (nonatomic,copy,readonly)UIView *(^gs_viewResignFirstResponder)();

/**前置视图 */
@property (nonatomic,copy,readonly)UIView *(^gs_viewBringFrontInView)();
/**下沉视图 */
@property (nonatomic,copy,readonly)UIView *(^gs_viewSendBackInView)();
@property (nonatomic,copy,readonly)CGRect (^gs_viewConvertRectToWindow)();
//更换父视图
@property (nonatomic,copy,readonly)UIView *(^gs_viewConvertSuperverTo)(UIView* , BOOL);
//移除所有子视图
@property (nonatomic,copy,readonly)UIView *(^gs_viewRemoveAllSubview)();

@property (nonatomic,copy,readonly)UIView *(^gs_viewContentMode)(UIViewContentMode);

#pragma mark - Animate


/**
 水平摇晃，有过度效果，只重复一次
 */
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateShakeHorizentalSoft)(double duration);

/**
 水平剧烈摇晃，自定义次数
 */
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateShakeHorizental)(double,float);


/**
 垂直摇晃，有过度效果，只重复一次
 */
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateShakeVerticalSoft)(double duration);

/**
 垂直摇晃剧烈，自定义次数
 */
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateShakeVertical)(double,float);

#pragma mark - move
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateMoveUp)(CGFloat distance, NSTimeInterval time);
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateMoveDown)(CGFloat distance, NSTimeInterval time);
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateMoveLeft)(CGFloat distance, NSTimeInterval time);
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateMoveRight)(CGFloat distance, NSTimeInterval time);

/**
 背景视差效果,ios7以上，左右上下翻动手机时会沿着各个方向发生位移
 */
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateAppleMotionEffects)(CGFloat effects);

@property (nonatomic,copy,readonly) UIView*      (^viewAnimatePulse)(CGFloat scale,NSTimeInterval duration,BOOL repeat);


@property (nonatomic,copy,readonly) UIView*      (^viewAnimateFlipFromTop)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);

@property (nonatomic,copy,readonly) UIView*      (^viewAnimateFlipFromLeft)(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);

#pragma mark - Rotate
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateRotateToLeft)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);
@property (nonatomic,copy,readonly)UIView* (^gs_viewAnimateRotateToRight)(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse);

#pragma mark - Snapshot
/** <^()>截屏当前视图 */
@property (nonatomic,copy,readonly)UIImage* (^gs_viewSnapshot)();
@end
