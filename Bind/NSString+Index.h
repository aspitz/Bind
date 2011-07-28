//
//  NSString+Index.h
//  Bind
//
//  Created by Ayal Spitz on 7/28/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Index)

- (NSUInteger)indexOfString:(NSString *)aString;
- (NSUInteger)indexOfString:(NSString *)aString fromIndex:(NSUInteger)index;

@end
