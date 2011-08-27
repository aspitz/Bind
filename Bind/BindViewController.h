//
//  BindViewController.h
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionBind;

@interface BindViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *viewModelDictionary;
@property (nonatomic, strong) IBOutlet UILabel *location;
@property (nonatomic, strong) IBOutlet UILabel *count;
@property (nonatomic, strong) NSMutableSet *models;

- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer;
- (void)handleTapGesture:(UIGestureRecognizer *)gestureRecognizer;
- (void)handleDoubleTapGesture:(UIGestureRecognizer *)gestureRecognizer;

@end
