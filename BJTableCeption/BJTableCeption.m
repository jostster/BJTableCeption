//
//  BJTableCeption.m
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import "BJTableCeption.h"

@interface BJTableCeption ()
{
    
}

@end

@implementation BJTableCeption

- (id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 100, 100)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect innerFrame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        [self commonInitWithFrame:innerFrame];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        CGRect innerFrame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        [self commonInitWithFrame:innerFrame];
    }
    return self;
}

- (void)commonInitWithFrame:(CGRect)frame
{
    UITableView *tableView =  [[UITableView alloc] initWithFrame:frame];
    tableView.delegate = (id<UITableViewDelegate>)self;
    tableView.dataSource = (id<UITableViewDataSource>)self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:tableView];
    [self setTableView:tableView];

}


- (void)setNumberOfSections:(int)sections
{
    
    _sections = [NSMutableArray arrayWithCapacity:sections];
    for (int x = 0; x < sections; x++) {
        NSMutableArray *array = [NSMutableArray array];
        [_sections addObject:array];
        array = nil;
    }
}

- (void)addCategory:(id)category toSection:(int)index
{
    [[_sections objectAtIndex:index] addObject:category];
}

- (NSUInteger)numberOfSections
{
    return [_sections count];
}

- (NSUInteger)numberOfRowsForSection:(NSUInteger)section
{
    return [[_sections objectAtIndex:section] count];
}

#pragma mark Creating Table View Cells

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier
{
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
}

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier
{
    [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
}

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    return [self.tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
