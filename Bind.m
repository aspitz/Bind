//
//  Bind.m
//
//  Created by Ayal Spitz on 7/21/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "Bind.h"

@implementation Bind

@synthesize srcObj;
@synthesize srcKeyPath;

@synthesize dstObj;
@synthesize dstKeyPath;

@synthesize transform;
@synthesize validation;

- (id)initWithSrc:(NSObject *)src srcKeyPath:(NSString *)srcPath dst:(NSObject *)dst andDstKeyPath:(NSString *)dstPath withTransform:(TransformBlock)tBlock andValidation:(ValidationBlock)vBlock{
    
    self = [super init];
    if (self) {
        // Store both the source object and source key path (We'll probably use this in the future)
        self.srcObj = src;
        self.srcKeyPath = srcPath;
        
        // Store the destination object and destination key path
        self.dstObj = dst;
        self.dstKeyPath = dstPath;
        
        // Store the transformation and validation blocks
        self.transform = tBlock;
        self.validation = vBlock;
        
        // Add an observer to the source object for the key path watching for new values
        [src addObserver:self forKeyPath:srcPath options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    /*[change enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"key: %@ - value: %@", key, obj);
    }];*/
    
    NSNumber *kind = [change valueForKey:NSKeyValueChangeKindKey];
    if ([kind intValue] == NSKeyValueChangeSetting){
        // Extract the new value from the change dictionary
        NSObject *value = [change valueForKey:NSKeyValueChangeNewKey];

        // Test to see if this ObserverLink has a validation block
        if (self.validation != nil){
            // If there is a validation block then test the value
            if (!self.validation(value)){
                // If the value fails the validation block then return
                return;
            }
        }
        
        // Test to see if this ObserverLink has a transform block
        if (self.transform != nil){
            // If there is a transform block then apply it to the value
            value = self.transform(value);
        }
        
        // Set the value of the destination object at the given key path
        [self.dstObj setValue:value forKeyPath:self.dstKeyPath];    
    }
}

- (void)remove{
    [self.srcObj removeObserver:self forKeyPath:self.srcKeyPath];
}

@end
