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

@implementation BindViewController

@synthesize aView;
@synthesize aModel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a view
    self.aView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
    self.aView.backgroundColor = [UIColor grayColor];
    self.aView.userInteractionEnabled = YES;
    [self.view addSubview:self.aView];
    
    // Create a model
    self.aModel = [[Model alloc]init];
    
    // Link changes in the model.pt to change the views center
    //  this link includes a transform of the point as well as a validation of the point
    [[BindingManager sharedManager] link:self atKeyPath:@"aModel.pt" to:self atKeyPath:@"aView.center"
                                withTransform:^NSObject *(NSObject *inObj){
                                    return inObj;
                                } andValidation:^BOOL(NSObject *inObj) {
                                    return YES;
                                }
     ];
    
    // Create a pan gesture to drag around the view
    UIGestureRecognizer *gesture = nil;
    gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:gesture];
    
    // Create a tap gesture to move the view
    gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


// Handle the pan gesture
- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint pt = [gestureRecognizer locationInView:self.view];
    // Update the models point
    self.aModel.pt = pt;
}

// Handle the tap gesture
- (void)handleTapGesture:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint pt = [gestureRecognizer locationInView:self.view];
    // Update the models point
    self.aModel.pt = pt;
}

@end
