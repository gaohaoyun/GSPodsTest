//
//  UIView+GSLinkBlock.m
//  GSLinkBlockDemo
//
//  Created by Mars Gao on 2016/11/24.
//  Copyright © 2016年 Mars Gao. All rights reserved.
//

#import "UIView+GSLinkBlock.h"

@implementation UIView (GSLinkBlock)
+ (instancetype)gs_labelinitWith:(void(^)(UIView *))mark{
    UIView *view = [[UIView alloc] init];
    if (mark) {
        mark(view);
    }
    return view;
}

- (UIView *(^)(CGRect))gs_viewFrame{
    return ^UIView *(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(UIColor *))gs_backgroundColor{
    return ^UIView *(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)())gs_viewBackgroundColorRandom{
    return ^UIView *(){
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        return self;
    };
}

#pragma mark - get
- (CGFloat (^)())gs_viewX{
    return ^CGFloat (){
        return CGRectGetMinX(self.frame);
    };
}

- (CGFloat (^)())gs_viewY{
    return ^CGFloat (){
        return CGRectGetMinY(self.frame);
    };
}

- (CGFloat (^)())gs_viewWidth{
    return ^CGFloat (){
        return CGRectGetWidth(self.bounds);
    };
}

- (CGFloat (^)())gs_viewHeight{
    return ^CGFloat (){
        return CGRectGetHeight(self.bounds);
    };
}

- (CGFloat (^)())gs_viewCenterX{
    return ^CGFloat (){
        return self.center.x;
    };
}

- (CGFloat (^)())gs_viewCenterY{
    return ^CGFloat (){
        return self.center.y;
    };
}


#pragma mark - Set

- (UIView *(^)(CGFloat))gs_setViewX{
    return ^UIView *(CGFloat x){
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))gs_setViewY{
    return ^UIView *(CGFloat y){
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))gs_setViewWidth{
    return ^UIView *(CGFloat width){
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))gs_setViewHeight{
    return ^UIView *(CGFloat height){
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}


- (UIView *(^)(CGFloat))gs_viewCornerRadius{
    return ^id(CGFloat cornerRadius){
        self.layer.cornerRadius= cornerRadius;
        return self;
    };
}

- (UIView *(^)(BOOL))gs_viewMasksToBounds
{
    return ^id(BOOL flag){
        self.layer.masksToBounds= flag;
        return self;
    };
}

- (UIView *(^)(BOOL))gs_viewHidden{
    return ^id(BOOL b){
        self.hidden= b;
        return self;
    };
}

#pragma mark - firstResponder

- (UIView *(^)(BOOL))gs_viewEndEditing{
    return ^id(BOOL force){
        [self endEditing:force];
        return self;
    };
}

- (UIView *(^)())gs_viewBecomeFirstResponder{
    return ^id(){
        [self becomeFirstResponder];
        return self;
    };
}

- (UIView *(^)())gs_viewResignFirstResponder{
    return ^id(){
        [self resignFirstResponder];
        return self;
    };
}

- (UIView *(^)())gs_viewBringFrontInView{
    return ^id(){
        if(self.superview)
            [self.superview bringSubviewToFront:self];
        return self;
    };
}

- (UIView *(^)())gs_viewSendBackInView{
    return ^id(){
        if(self.superview)
            [self.superview sendSubviewToBack:self];
        return self;
    };
}

#pragma mark - rect

- (CGRect (^)())gs_viewConvertRectToWindow
{
    return ^(){
        return [self.superview convertRect:self.frame toView:nil];
    };
}
- (UIView *(^)(UIView *, BOOL))gs_viewConvertSuperverTo{
    return ^(UIView* aView, BOOL isKeep){
        if(isKeep){
            CGRect toAViewRect = [self.superview convertRect:self.frame toView:aView];
            [self removeFromSuperview];
            [aView addSubview:self];
            self.frame=toAViewRect;
        }else{
            [self removeFromSuperview];
            [aView addSubview:self];
        }
        return self;
    };
}

#pragma mark - viewRemoveAllSubView

- (UIView *(^)())gs_viewRemoveAllSubview{
    return ^id(){
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        return self;
    };
}

- (UIView *(^)(UIViewContentMode))gs_viewContentMode{
    return ^id(UIViewContentMode contentMode){
        self.contentMode = contentMode;
        return self;
    };
}

#pragma mark - Animator

#pragma mark - shake
- (UIView *(^)(double))gs_viewAnimateShakeHorizentalSoft{
    return ^(double duration){
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
        [self.layer addAnimation:animation forKey:@"HorizentalShakesSoft"];
        return self;
    };
}

- (UIView *(^)(double,float))gs_viewAnimateShakeHorizental{
    return ^(double duration,float repeatCount){
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.values = @[@(5),@(-10),@(5),@(-10),@(5)];
        animation.repeatCount = repeatCount;
        [self.layer addAnimation:animation forKey:@"HorizentalShakes"];
        return self;
    };
}

- (UIView *(^)(double))gs_viewAnimateShakeVerticalSoft{
    return ^(double duration){
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
        [self.layer addAnimation:animation forKey:@"VerticalShakesSoft"];
        return self;
    };
}

- (UIView *(^)(double,float))gs_viewAnimateShakeVertical{
    return ^(double duration,float repeatCount){
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.values = @[@(5),@(-10),@(5),@(-10),@(5)];
        animation.repeatCount = repeatCount;
        [self.layer addAnimation:animation forKey:@"VerticalShakes"];
        return self;
    };
}


- (UIView *(^)(CGFloat distance, NSTimeInterval time))gs_viewAnimateMoveUp{
    return ^(CGFloat distance, NSTimeInterval time){
        [UIView animateWithDuration:time animations:^{
            self.transform = CGAffineTransformTranslate(self.transform,0 , -distance);
        }];
        return self;
    };
}

- (UIView *(^)(CGFloat distance, NSTimeInterval time))gs_viewAnimateMoveDown{
    return ^(CGFloat distance, NSTimeInterval time){
        [UIView animateWithDuration:time animations:^{
            self.transform = CGAffineTransformTranslate(self.transform,0 , distance);
        }];
        return self;
    };
}

- (UIView *(^)(CGFloat distance, NSTimeInterval time))gs_viewAnimateMoveLeft{
    return ^(CGFloat distance, NSTimeInterval time){
        [UIView animateWithDuration:time animations:^{
            self.transform = CGAffineTransformTranslate(self.transform,-distance , 0);
        }];
        return self;
    };
}

- (UIView *(^)(CGFloat distance, NSTimeInterval time))gs_viewAnimateMoveRight{
    return ^(CGFloat distance, NSTimeInterval time){
        [UIView animateWithDuration:time animations:^{
            self.transform = CGAffineTransformTranslate(self.transform,distance , 0);
        }];
        return self;
    };
}

- (UIView *(^)(CGFloat))gs_viewAnimateAppleMotionEffects{
    return ^id(CGFloat effects){
        // Motion effects are available starting from iOS 7.
        if (([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending))
        {
            
            UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                            type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
            horizontalEffect.minimumRelativeValue = @(-effects);
            horizontalEffect.maximumRelativeValue = @(effects);
            UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                          type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
            verticalEffect.minimumRelativeValue = @(-effects);
            verticalEffect.maximumRelativeValue = @( effects);
            UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
            motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
            
            [self addMotionEffect:motionEffectGroup];
        }
        return self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval, BOOL))viewAnimatePulse{
    return ^id(CGFloat scale,NSTimeInterval duration,BOOL repeat){
        CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulseAnimation.duration = duration;
        pulseAnimation.toValue = [NSNumber numberWithFloat:scale];
        pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pulseAnimation.autoreverses = YES;
        pulseAnimation.repeatCount = repeat ? HUGE_VALF : 0;
        [self.layer addAnimation:pulseAnimation forKey:@"pulse"];
        return self;
    };
}


- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromTop{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromTop;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        [self.layer addAnimation:transition forKey:@"spin"];
        return self;
    };
}
- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromLeft
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = @"oglFlip";
        transition.subtype = kCATransitionFromLeft;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        
        [self.layer addAnimation:transition
                           forKey:@"spin"];
        return self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))gs_viewAnimateRotateToLeft{
    return ^id(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = @(-angle);
        rotationAnimation.duration = duration;
        rotationAnimation.autoreverses = shouldAutoreverse;
        rotationAnimation.repeatCount = repeatCount;
        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer addAnimation:rotationAnimation
                           forKey:@"transform.rotation.z"];
        return self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))gs_viewAnimateRotateToRight{
    return ^id(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = @(angle);
        rotationAnimation.duration = duration;
        rotationAnimation.autoreverses = shouldAutoreverse;
        rotationAnimation.repeatCount = repeatCount;
        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.layer addAnimation:rotationAnimation
                          forKey:@"transform.rotation.z"];
        return self;
    };
}

- (UIImage *(^)())gs_viewSnapshot{
    return ^id(){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
        UIImage *re = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return re;
    };
}
@end
