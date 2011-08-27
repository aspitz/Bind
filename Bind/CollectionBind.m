//
//  CollectionBind.m
//  Bind
//
//  Created by Ayal Spitz on 8/25/11.
//  Copyright (c) 2011 Ayal Spitz. All rights reserved.
//

#import "CollectionBind.h"

@implementation CollectionBind

@synthesize srcObj;
@synthesize srcKeyPath;

@synthesize dstObj;
@synthesize dstKeyPath;

@synthesize addBlock;
@synthesize removeBlock;

- (id)initWithSrc:(NSObject *)src srcKeyPath:(NSString *)srcPath dst:(NSObject *)dst andDstKeyPath:(NSString *)dstPath withAdd:(AddBlock)aBlock andRemove:(RemoveBlock)rBlock{
    
    self = [super init];
    if (self) {
        // Store both the source object and source key path (We'll probably use this in the future)
        self.srcObj = src;
        self.srcKeyPath = srcPath;
        
        // Store the destination object and destination key path
        self.dstObj = dst;
        self.dstKeyPath = dstPath;
        
        // Store the transformation and validation blocks
        self.addBlock = aBlock;
        self.removeBlock = rBlock;
        
        // Add an observer to the source object for the key path watching for new values
        [src addObserver:self forKeyPath:srcPath 
                 options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                 context:NULL];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    /*NSLog(@"beep");
     [change enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
     NSLog(@"key: %@ - value: %@ (%@)", key, obj, [obj class]);
     }];*/
    
    id collection;
    NSEnumerator *enumerator;
    NSObject *obj;
    NSNumber *kind = [change valueForKey:NSKeyValueChangeKindKey];

    switch ([kind intValue]) {
        case NSKeyValueChangeSetting:
            break;
        case NSKeyValueChangeInsertion:
            if (addBlock != nil){
                collection = [change valueForKey:NSKeyValueChangeNewKey];
                enumerator = [collection objectEnumerator];
                obj = [enumerator nextObject];
                addBlock(obj, dstObj, dstKeyPath);
            }
            break;
        case NSKeyValueChangeRemoval:
            if (removeBlock != nil){
                collection = [change valueForKey:NSKeyValueChangeOldKey];
                enumerator = [collection objectEnumerator];
                obj = [enumerator nextObject];
                removeBlock(obj, dstObj, dstKeyPath);
            }
            break;
        default:
            break;
    }
}

- (void)remove{
}

@end
