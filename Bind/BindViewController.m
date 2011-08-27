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
#import "PanGestureRecognizer.h"
#import "CollectionBind.h"
#import "UIGestureRecognizer+View.h"

@implementation BindViewController

@synthesize viewModelDictionary;

@synthesize location;
@synthesize count;
@synthesize models;

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
    [self.view recognizeDoubleTapGestureWithTarget:self action:@selector(handleDoubleTapGesture:)];    
    [self.view recognizePanGestureWithTarget:self action:@selector(handlePanGesture:)];    

    self.models = [[NSMutableSet alloc]init];
    [BindingManager bindCollection:@"view" of:self to:@"models" of:self
                           withAdd:^(NSObject *value, NSObject *obj, NSString *keyPath){
                                    Model *aModel = (Model *)value;
                                    BindViewController *blockSelf = (BindViewController *)obj;
                            
                                    // Create a view
                                    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
                                    aView.center = aModel.pt;
                                    aView.backgroundColor = [UIColor grayColor];
                                    aView.userInteractionEnabled = YES;
                                    [blockSelf.view addSubview:aView];
                                
                                    // Bind the views center to the model.pt
                                    [BindingManager bind:@"center" of:aView to:@"pt" of:aModel];    
                                
                                    [blockSelf.viewModelDictionary setObject:aModel forNSObjectKey:aView];
                                    [blockSelf.viewModelDictionary setObject:aView forNSObjectKey:aModel];
                                }
                                andRemove:^(NSObject *value, NSObject *obj, NSString *keyPath) {
                                    Model *aModel = (Model *)value;
                                    BindViewController *blockSelf = (BindViewController *)obj;
                                
                                    UIView *aView = [blockSelf.viewModelDictionary objectForNSObjectKey:aModel];
                                
                                    [blockSelf.viewModelDictionary removeObjectForNSObjectKey:aModel];
                                    [blockSelf.viewModelDictionary removeObjectForNSObjectKey:aView];
                                
                                    [aView removeFromSuperview];
                                }
     ];
    
    [BindingManager bind:@"count.text" of:self to:@"models.@count" of:self 
           withTransform:^NSObject *(NSObject *inObj){
               return [inObj description];
           }
     ];
}

// Handle the pan gesture
- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer{
    UIView *tempView = ((PanGestureRecognizer *)gestureRecognizer).startingView;
    
    CGPoint pt = [gestureRecognizer locationInView:self.view];

    Model *model = [viewModelDictionary objectForNSObjectKey:tempView];
    
    // Update the models point
    model.pt = pt;
}

// Handle the tap gesture
- (void)handleTapGesture:(UIGestureRecognizer *)gestureRecognizer{
    UIView *tempView = [gestureRecognizer touchedView];
    
    if (tempView == self.view){
        // Create a model
        Model *aModel = [[Model alloc]init];
        aModel.pt = [gestureRecognizer locationInView:self.view];

        // Bind the label text to the model.pt using a transform
        [BindingManager bind:@"location.text" of:self to:@"pt" of:aModel 
               withTransform:^NSObject *(NSObject *inObj){
                   CGPoint pt = [((NSValue *)inObj) CGPointValue];
                   return [NSString stringWithFormat:@"%f,%f", pt.x, pt.y];
               }
         ];
        
        NSMutableSet *modelSet = [self mutableSetValueForKeyPath:@"models"];
        [modelSet addObject:aModel];
    }
}

// Handle the tap gesture
- (void)handleDoubleTapGesture:(UIGestureRecognizer *)gestureRecognizer{
    UIView *tempView = [gestureRecognizer touchedView];

    if (tempView != self.view){
        Model *aModel = [self.viewModelDictionary objectForNSObjectKey:tempView];
        NSMutableSet *modelSet = [self mutableSetValueForKeyPath:@"models"];
        [modelSet removeObject:aModel];
    }
}

@end
