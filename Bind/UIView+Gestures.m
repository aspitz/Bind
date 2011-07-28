//
//  UIView+Gestures.m
//  Bind
//
//  Created by Ayal Spitz on 7/25/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "UIView+Gestures.h"
#import "PanGestureRecognizer.h"

@implementation UIView (Gestures)

- (UITapGestureRecognizer *)recognizeTapGestureWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [gesture setNumberOfTapsRequired:1];
    [self addGestureRecognizer:gesture];
    return gesture;
}

- (UITapGestureRecognizer *)recognizeDoubleTapGestureWithTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [gesture setNumberOfTapsRequired:2];
    [self addGestureRecognizer:gesture];
    return gesture;
}

- (UIPanGestureRecognizer *)recognizePanGestureWithTarget:(id)target action:(SEL)action{
    UIPanGestureRecognizer *gesture = [[PanGestureRecognizer alloc]initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
    return gesture;
}

@end
