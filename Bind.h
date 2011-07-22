//
//  Bind.h
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSObject *(^TransformBlock)(NSObject *);
typedef BOOL(^ValidationBlock)(NSObject *);

@interface Bind : NSObject

@property (nonatomic, strong) NSObject *srcObj;
@property (nonatomic, strong) NSString *srcKeyPath;

@property (nonatomic, strong) NSObject *dstObj;
@property (nonatomic, strong) NSString *dstKeyPath;

@property (nonatomic, assign) TransformBlock transform;
@property (nonatomic, assign) ValidationBlock validation;

- (id)initWithSrc:(NSObject *)src srcKeyPath:(NSString *)srcPath dst:(NSObject *)dst andDstKeyPath:(NSString *)dstPath withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock;

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

- (void)remove;

@end
