//
//  BindingManager.h
//  Bind
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bind.h"

@interface BindingManager : NSObject

@property (nonatomic, strong) NSMutableSet *bindings;

+ (BindingManager *)sharedManager;

- (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src;
- (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withTransform:(TransformBlock)block;
- (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withValidation:(ValidationBlock)block;
- (id)bind:(NSString *)dstPath of:(NSObject *)dst to:(NSString *)srcPath of:(NSObject *)src withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock;

@end
