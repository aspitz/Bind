//
//  BindingManager.m
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "BindingManager.h"

static BindingManager *sharedObserverLinkManager = nil;

@implementation BindingManager

@synthesize bindings;

+ (BindingManager *)sharedManager{
    if (sharedObserverLinkManager == nil) {
        sharedObserverLinkManager = [[BindingManager alloc]init];
    }
    return sharedObserverLinkManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.bindings = [[NSMutableSet alloc]init];
    }
    
    return self;
}

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath{
    return [self link:src atKeyPath:srcPath to:dst atKeyPath:dstPath withTransform:nil andValidation:nil];
}

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withTransform:(TransformBlock)block{
    return [self link:src atKeyPath:srcPath to:dst atKeyPath:dstPath withTransform:block andValidation:nil];
}

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withValidation:(ValidationBlock)block{    
    return [self link:src atKeyPath:srcPath to:dst atKeyPath:dstPath withTransform:nil andValidation:block];
}

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock{
    
    Bind *bind = [[Bind alloc]initWithSrc:src srcKeyPath:srcPath dst:dst andDstKeyPath:dstPath withTransform:tBlock andValidation:vBlock];
    
    [self.bindings addObject:bind];
    
    return bind;
}


@end
