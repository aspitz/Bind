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

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath;

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withTransform:(TransformBlock)block;

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withValidation:(ValidationBlock)block;

- (id)link:(NSObject *)src atKeyPath:(NSString *)srcPath to:(NSObject *)dst atKeyPath:(NSString *)dstPath withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock;

@end
