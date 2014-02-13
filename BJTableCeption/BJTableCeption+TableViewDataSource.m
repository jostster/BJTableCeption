//
//  BJTableCeption+TableViewDataSource.m
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import "BJTableCeption+TableViewDataSource.h"
#import "BJCategoryObject.h"
#import "BJItemObject.h"

@interface BJTableCeption ()
{
    
}

@end

@implementation BJTableCeption (TableViewDataSource)


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataSource numberOfSectionsInTableView:self];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dataSource tableCeption:self titleForHeaderInSection:(NSInteger)section];
    return ((BJSectionObject *)[self.sections objectAtIndex:section]).name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger totalRows = [[self.sections objectAtIndex:section] count];
    for (BJCategoryObject *category in [self.sections objectAtIndex:section]) {
        totalRows += [[category children] count];
    }
    
    return totalRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id tableItem = [self.delegate tableCeptionItemForIndexPath:indexPath];
    return [self.dataSource tableCeption:self cellForItem:tableItem];
}



@end
