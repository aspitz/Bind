//
//  BindViewController.h
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BindViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *viewModelDictionary;

- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer;

@end
