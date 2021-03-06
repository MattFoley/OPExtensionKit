//
//  UIView+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/25/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIView+Opetopic.h"

@implementation UIView (Opetopic)

-(CGFloat) left {
	return self.frame.origin.x;
}

-(void) setLeft:(CGFloat)x {
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

-(CGFloat) right {
	return self.frame.origin.x + self.frame.size.width;
}

-(void) setRight:(CGFloat)right {
	CGRect frame = self.frame;
	frame.origin.x = right - frame.size.width;
	self.frame = frame;
}

-(CGFloat) top {
	return self.frame.origin.y;
}

-(void) setTop:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

-(CGFloat) bottom {
	return self.frame.origin.y + self.frame.size.height;
}

-(void) setBottom:(CGFloat)bottom {
	CGRect frame = self.frame;
	frame.origin.y = bottom - frame.size.height;
	self.frame = frame;
}

-(CGPoint) topLeft {
    return self.origin;
}

-(void) setTopLeft:(CGPoint)topLeft {
    self.origin = topLeft;
}

-(CGPoint) topRight {
    return CGPointMake(self.right, self.top);
}

-(void) setTopRight:(CGPoint)topRight {
    self.right = topRight.x;
    self.top = topRight.y;
}

-(CGPoint) bottomLeft {
    return CGPointMake(self.left, self.bottom);
}

-(void) setBottomLeft:(CGPoint)bottomLeft {
    self.left = bottomLeft.x;
    self.bottom = bottomLeft.y;
}

-(CGPoint) bottomRight {
    return CGPointMake(self.right, self.bottom);
}

-(void) setBottomRight:(CGPoint)bottomRight {
    self.right = bottomRight.x;
    self.bottom = bottomRight.y;
}

-(void) setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(CGPoint) origin {
    return self.frame.origin;
}

-(CGFloat) width {
	return self.frame.size.width;
}

-(void) setWidth:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

-(CGFloat) height {
	return self.frame.size.height;
}

-(void) setHeight:(CGFloat) height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

-(void) setSize:(CGSize)size {
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

-(CGSize) size {
	return self.frame.size;
}

- (CGFloat)centerX {
    return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX {
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY {
    return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY {
    [self setCenter:CGPointMake(self.center.x, centerY)];
}


-(void) centerXWithin:(UIView*)v {
    self.left = roundf(v.bounds.size.width/2.0f - self.width/2.0f);
}

-(void) centerYWithin:(UIView*)v {
    self.top = roundf(v.bounds.size.height/2.0f - self.height/2.0f);
}

-(void) centerWithin:(UIView*)v {
    [self centerXWithin:v];
    [self centerYWithin:v];
}

-(id) initWithSize:(CGSize)size {
    return [self initWithFrame:(CGRect){0.0f, 0.0f, size}];
}

-(void) setNeedsDisplayAndLayout {
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

-(void) addSubviewToBack:(UIView *)view {
    [self addSubview:view];
    [self sendSubviewToBack:view];
}

-(void) hideAllSubviews {
	
	for (UIView *s in self.subviews)
		s.hidden = YES;
}

-(void) removeAllSubviews {
    
    while ([self.subviews count])
        [[self.subviews lastObject] removeFromSuperview];
}

-(void) bringToFront {
    [self.superview bringSubviewToFront:self];
}

-(void) sendToBack {
    [self.superview sendSubviewToBack:self];
}

-(UIImage*) renderedImage {
    return [self renderedImage:[[UIScreen mainScreen] scale]];
}

-(UIImage*) renderedImage:(CGFloat)scale {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(void) animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations asapCompletion:(void (^)(BOOL finished))completion {
    
    if (duration <= 0.0f)
    {
        animations();
        completion(YES);
    }
    else
        [[self class] animateWithDuration:duration animations:animations completion:completion];
}

-(NSString*) rDescription {
#ifdef DEBUG
    return [self performSelector:@selector(recursiveDescription)];
#else
    return [self description];
#endif
}

@end
