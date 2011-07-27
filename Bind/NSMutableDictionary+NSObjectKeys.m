//
//  NSMutableDictionary+NSObjectKeys.m
//  Bind
//
//  Created by Ayal Spitz on 7/26/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "NSMutableDictionary+NSObjectKeys.h"

@implementation NSMutableDictionary (NSObjectKeys)

- (void)setObject:(id)anObject forNSObjectKey:(NSObject *)anNSObjectKey{
    NSString *key = [NSString stringWithFormat:@"%d", anNSObjectKey.hash];
    [self setValue:anObject forKey:key];
}

- (id)objectForNSObjectKey:(NSObject *)anNSObjectKey{
    NSString *key = [NSString stringWithFormat:@"%d", anNSObjectKey.hash];
    return [self objectForKey:key];
}

- (void)removeObjectForNSObjectKey:(NSObject *)anNSObjectKey{
    NSString *key = [NSString stringWithFormat:@"%d", anNSObjectKey.hash];
    [self removeObjectForKey:key];
}

@end
