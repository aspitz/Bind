//
//  UIView+Gestures.h
//  Bind
//
//  Created by Ayal Spitz on 7/25/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gestures)

- (UITapGestureRecognizer *)recognizeTapGestureWithTarget:(id)target action:(SEL)action;
- (UITapGestureRecognizer *)recognizeDoubleTapGestureWithTarget:(id)target action:(SEL)action;
- (UIPanGestureRecognizer *)recognizePanGestureWithTarget:(id)target action:(SEL)action;

@end
