//
//  BindViewController.m
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "BindViewController.h"
#import "BindingManager.h"
#import "Model.h"
#import "UIView+Gestures.h"
#import "NSMutableDictionary+NSObjectKeys.h"

@implementation BindViewController

@synthesize viewModelDictionary;
@synthesize label;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewModelDictionary = [[NSMutableDictionary alloc]init];
    [self.view recognizeTapGestureWithTarget:self action:@selector(handleTapGesture:)];    
}

// Handle the pan gesture
- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint pt = [gestureRecognizer locationInView:self.view];

    Model *model = [viewModelDictionary objectForNSObjectKey:gestureRecognizer.view];
    
    // Update the models point
    model.pt = pt;
}

// Handle the tap gesture
- (void)handleTapGesture:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint pt = [gestureRecognizer locationInView:self.view];
    
    // Create a view
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
    aView.center = pt;
    aView.backgroundColor = [UIColor grayColor];
    aView.userInteractionEnabled = YES;
    [self.view addSubview:aView];
    
    // Create a model
    Model *aModel = [[Model alloc]init];
    
    // Link changes in the model.pt to change the views center
    //  this link includes a transform of the point as well as a validation of the point
    [[BindingManager sharedManager] bind:aModel atKeyPath:@"pt" to:aView atKeyPath:@"center"];
    
    [[BindingManager sharedManager] bind:aModel atKeyPath:@"pt" to:self atKeyPath:@"label.text"
                           withTransform:^NSObject *(NSObject *inObj){
                               CGPoint pt = [((NSValue *)inObj) CGPointValue];
                               return [NSString stringWithFormat:@"%f,%f", pt.x, pt.y];
                           }];
    
    // Create a pan gesture to drag around the view
    [aView recognizePanGestureWithTarget:self action:@selector(handlePanGesture:)];
    
    [viewModelDictionary setObject:aModel forNSObjectKey:aView];
}

@end
