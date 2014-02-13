//
//  BJItemObject.h
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJItemObject : NSObject

@property (strong, nonatomic) id item;

- (id)initWithItem:(id)item;

+ (id)itemWithObject:(id)item;

@end
