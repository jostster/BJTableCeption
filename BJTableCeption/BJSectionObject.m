//
//  BJSectionObject.m
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import "BJSectionObject.h"

@implementation BJSectionObject

- (id)initWithSection:(int)index name:(NSString *)name children:(NSArray *)children
{
    self = [super init];
    if (self) {
        self.section = index;
        self.children = children;
        self.name = name;
    }
    
    return self;
}



+ (id)itemsForSection:(int)index name:(NSString *)name children:(NSArray *)children
{
    return [[self alloc] initWithSection:index name:name children:children];
}

@end
