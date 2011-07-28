//
//  PanGestureRecognizer.m
//  Bind
//
//  Created by Ayal Spitz on 7/28/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "PanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation PanGestureRecognizer
@synthesize startingTouches;
@synthesize startingView;

- (id)initWithTarget:(id)target action:(SEL)action{
    self = [super initWithTarget:target action:action];
    if (self) {}
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.startingTouches = touches;
    self.startingView = ((UITouch *)[[touches objectEnumerator]nextObject]).view;
                         
    [super touchesBegan:touches withEvent:event];
}

@end
