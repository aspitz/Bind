//
//  BindingManager.m
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "BindingManager.h"

static BindingManager *bindingManager = nil;

@implementation BindingManager

@synthesize bindings;

+ (BindingManager *)sharedManager{
    if (bindingManager == nil) {
        bindingManager = [[BindingManager alloc]init];
    }
    return bindingManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.bindings = [[NSMutableSet alloc]init];
    }
    
    return self;
}

- (id)bind:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath{
    return [self bind:src atKeyPath:srcPath to:dst atKeyPath:dstPath withTransform:nil andValidation:nil];
}

- (id)bind:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withTransform:(TransformBlock)block{
    return [self bind:src atKeyPath:srcPath to:dst atKeyPath:dstPath withTransform:block andValidation:nil];
}

- (id)bind:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withValidation:(ValidationBlock)block{    
    return [self bind:src atKeyPath:srcPath to:dst atKeyPath:dstPath withTransform:nil andValidation:block];
}

- (id)bind:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock{
    
    Bind *bind = [[Bind alloc]initWithSrc:src srcKeyPath:srcPath dst:dst andDstKeyPath:dstPath withTransform:tBlock andValidation:vBlock];
    
    [self.bindings addObject:bind];
    
    return bind;
}


@end
