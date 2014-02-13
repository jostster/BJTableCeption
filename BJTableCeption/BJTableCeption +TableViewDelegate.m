//
//  UITableViewDelegate+TableViewDelegate.m
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import "BJTableCeption+TableViewDelegate.h"
#import "BJTableCeption+TableViewDataSource.h"

@implementation BJTableCeption (TableViewDelegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableCeption:heightForRowForItem:)]) {
        id item = [self.delegate tableCeptionItemForIndexPath:indexPath];
        return [self.delegate tableCeption:self heightForRowForItem:item];
    }
    return self.tableView.rowHeight;
}

@end
