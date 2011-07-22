//
//  Model.m
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "Model.h"

@implementation Model

@synthesize pt;

- (id)init
{
    self = [super init];
    if (self) {
        self.pt = CGPointZero;
    }
    
    return self;
}

@end
