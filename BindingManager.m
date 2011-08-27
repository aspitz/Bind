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

+ (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src{
    return [BindingManager bind:dstPath of:dst to:srcPath of:src withTransform:nil andValidation:nil];
}

+ (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withTransform:(TransformBlock)block{
    return [BindingManager bind:dstPath of:dst to:srcPath of:src withTransform:block andValidation:nil];
}

+ (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withValidation:(ValidationBlock)block{
    return [BindingManager bind:dstPath of:dst to:srcPath of:src withTransform:nil andValidation:block];
}

+ (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock{
    
    Bind *bind = [[Bind alloc]initWithSrc:src srcKeyPath:srcPath dst:dst andDstKeyPath:dstPath withTransform:tBlock andValidation:vBlock];
    
    [[BindingManager sharedManager].bindings addObject:bind];
    
    return bind;
}


+ (id)bindCollection:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withAdd:(AddBlock)aBlock andRemove:(RemoveBlock)rBlock{
    
    CollectionBind *bind = [[CollectionBind alloc]initWithSrc:src srcKeyPath:srcPath dst:dst andDstKeyPath:dstPath withAdd:aBlock andRemove:rBlock];
    
    [[BindingManager sharedManager].bindings addObject:bind];
    
    return bind;
}

@end
