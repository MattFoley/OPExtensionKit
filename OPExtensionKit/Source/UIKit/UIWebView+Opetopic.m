//
//  UIWebView+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/9/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "UIWebView+Opetopic.h"

@implementation UIWebView (Opetopic)

-(void) clearCookies {
    
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies])
        [storage deleteCookie:cookie];
}

-(void) removeBackgroundGradients {
    
    for (UIView *subview in self.scrollView.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            [subview setHidden:YES];
        }
    }
}

@end
