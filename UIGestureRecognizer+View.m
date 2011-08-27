//
//  UIGestureRecognizer+View.m
//  Bind
//
//  Created by Ayal Spitz on 8/27/11.
//  Copyright (c) 2011 Ayal Spitz. All rights reserved.
//

#import "UIGestureRecognizer+View.h"

@implementation UIGestureRecognizer (View)

- (UIView *)touchedView{
    CGPoint pt = [self locationInView:self.view];
    return [self.view hitTest:pt withEvent:nil];
}

@end
