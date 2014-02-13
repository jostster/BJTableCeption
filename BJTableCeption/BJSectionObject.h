//
//  BJSectionObject.h
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJSectionObject : NSObject

@property (nonatomic) int section;
@property (strong, nonatomic) NSArray *children;
@property (strong, nonatomic) NSString *name;

- (id)initWithSection:(int)index name:(NSString *)name children:(NSArray *)children;

+ (id)itemsForSection:(int)index name:(NSString *)name children:(NSArray *)children;


@end
