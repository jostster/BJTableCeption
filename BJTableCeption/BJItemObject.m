//
//  BJItemObject.m
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import "BJItemObject.h"

@implementation BJItemObject

- (id)initWithItem:(id)item
{
    self = [super init];
    
    if (self) {
        self.item = item;
    }
    
    return self;
}

+ (id)itemWithObject:(id)item
{
    return [[self alloc] initWithItem:item];
}

@end
