//
//  BindViewController.h
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;
@class ObserverLink;

@interface BindViewController : UIViewController

@property (nonatomic, strong) UIView *aView;
@property (nonatomic, strong) Model *aModel;

- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer;
- (void)handleTapGesture:(UIGestureRecognizer *)gestureRecognizer;

@end
