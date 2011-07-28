//
//  PanGestureRecognizer.h
//  Bind
//
//  Created by Ayal Spitz on 7/28/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanGestureRecognizer : UIPanGestureRecognizer

@property (nonatomic, strong) NSSet *startingTouches;
@property (nonatomic, strong) UIView *startingView;

@end
