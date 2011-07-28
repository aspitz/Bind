//
//  NSString+Index.m
//  Bind
//
//  Created by Ayal Spitz on 7/28/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import "NSString+Index.h"

@implementation NSString (Index)

- (NSUInteger)indexOfString:(NSString *)aString{
    return [self indexOfString:aString fromIndex:0];
}

- (NSUInteger)indexOfString:(NSString *)aString fromIndex:(NSUInteger)index{
    NSRange searchRange = NSMakeRange(index, aString.length - index);
    NSRange indexRange = [self rangeOfString:aString options:NSLiteralSearch range:searchRange];

    return indexRange.location;
}

@end
