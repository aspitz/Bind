//
//  UIView+Gestures.m
//  Bind
//
//  Created by Ayal Spitz on 7/25/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "UIView+Gestures.h"

@implementation UIView (Gestures)

- (UITapGestureRecognizer *)recognizeTapGestureWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
    return gesture;
}

- (UIPanGestureRecognizer *)recognizePanGestureWithTarget:(id)target action:(SEL)action{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
    return gesture;
}

@end
