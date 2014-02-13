//
//  BJCategoryObject.m
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import "BJCategoryObject.h"

@implementation BJCategoryObject

- (id)initWithItem:(id)item children:(NSArray *)children
{
    self = [super init];
    
    if (self) {
        self.item = item;
        self.children = children;
    }
    
    return self;
}

+ (id)itemWithObject:(id)item children:(NSArray *)children
{
    return [[self alloc] initWithItem:item children:children];
}

@end
