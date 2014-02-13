//
//  BJCategoryObject.h
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJCategoryObject : NSObject

@property (strong, nonatomic) id item;
@property (strong, nonatomic) NSArray *children;

- (id)initWithItem:(id)item children:(NSArray *)children;

+ (id)itemWithObject:(id)item children:(NSArray *)children;

@end
