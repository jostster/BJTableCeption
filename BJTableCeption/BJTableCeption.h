//
//  BJTableCeption.h
//  BJTableCeption
//
//  Created by Brian Jost on 1/22/14.
//  Copyright (c) 2014 Brian Jost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BJItemObject.h"
#import "BJCategoryObject.h"
#import "BJSectionObject.h"

@class BJTableCeption;

@protocol BJTableCeptionDataSource <NSObject>

@required
- (NSInteger)numberOfSectionsInTableView:(BJTableCeption *)tableCeption;
- (UITableViewCell *)tableCeption:(BJTableCeption *)tableCeption cellForItem:(id)item;
//- (id)tableCeption:(BJTableCeption *)tableCeption child:(NSInteger)index ofItem:(id)item;
- (NSString *)tableCeption:(BJTableCeption *)tableCeption titleForHeaderInSection:(NSInteger)section;
- (id)tableCeptionItemForIndexPath:(NSIndexPath *)indexPath;
- (id)tableCeptionItemForIndex:(NSInteger)index section:(id)currentSection;
@optional

@end


@protocol BJTableCeptionDelegate <NSObject>
@optional
// Configuring Rows for the Table View
- (CGFloat)tableCeption:(BJTableCeption *)tableCeption heightForRowForItem:(id)item;
- (id)tableCeptionItemForIndexPath:(NSIndexPath *)indexPath;

@end

@interface BJTableCeption : UIView

@property (weak, nonatomic) id<BJTableCeptionDataSource> dataSource;
@property (weak, nonatomic) id<BJTableCeptionDelegate> delegate;

// Creating Table View Cells
- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);
- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;


@property (strong, nonatomic, readonly) NSMutableArray *sections;
@property (strong, nonatomic) UITableView *tableView;

- (void)setNumberOfSections:(int)sections;

- (void)addCategory:(id)category toSection:(int)index;

- (NSUInteger)numberOfSections;

- (NSUInteger)numberOfRowsForSection:(NSUInteger)section;

@end
