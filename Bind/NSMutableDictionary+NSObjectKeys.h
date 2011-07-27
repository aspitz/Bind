//
//  NSMutableDictionary+NSObjectKeys.h
//  Bind
//
//  Created by Ayal Spitz on 7/26/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (NSObjectKeys)

- (void)setObject:(id)anObject forNSObjectKey:(NSObject *)anNSObjectKey;
- (id)objectForNSObjectKey:(NSObject *)anNSObjectKey;
- (void)removeObjectForNSObjectKey:(NSObject *)anNSObjectKey;

@end
