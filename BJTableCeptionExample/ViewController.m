//
//  ViewController.m
//  BJTableCeptionExample
//
//  Created by Brian Jost on 2/10/14.
//
//

#import "ViewController.h"
#import "BJTableCeption.h"
#import "BJTableCeptionExampleCell.h"

@interface ViewController () <BJTableCeptionDataSource, BJTableCeptionDelegate>
@property (strong, nonatomic) BJTableCeption *tableCeption;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tableCeption = [[BJTableCeption alloc] initWithFrame:CGRectZero];
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableCeption.tableView.tableFooterView = footer;
    
    [self.tableCeption setNumberOfSections:3];
    
    BJItemObject *item10 = [BJItemObject itemWithObject:@"item10"];
    BJItemObject *item11 = [BJItemObject itemWithObject:@"item11"];
    BJCategoryObject *category1 = [BJCategoryObject itemWithObject:@"Cat 1" children:@[item10, item11]];
    [self.tableCeption addCategory:category1 toSection:0];
    [self.tableCeption addCategory:category1 toSection:1];
    [self.tableCeption addCategory:category1 toSection:2];

    BJItemObject *item20 = [BJItemObject itemWithObject:@"item20"];
    BJItemObject *item21 = [BJItemObject itemWithObject:@"item21"];
    BJCategoryObject *category2 = [BJCategoryObject itemWithObject:@"Cat 2" children:@[item20, item21]];
    [self.tableCeption addCategory:category2 toSection:0];
    [self.tableCeption addCategory:category2 toSection:1];
    [self.tableCeption addCategory:category2 toSection:2];

    BJItemObject *item30 = [BJItemObject itemWithObject:@"item30"];
    BJItemObject *item31 = [BJItemObject itemWithObject:@"item31"];
    BJCategoryObject *category3 = [BJCategoryObject itemWithObject:@"Cat 3" children:@[item30, item31]];
    [self.tableCeption addCategory:category3 toSection:0];
    [self.tableCeption addCategory:category3 toSection:1];
    [self.tableCeption addCategory:category3 toSection:2];
    
    self.tableCeption.dataSource = self;
    self.tableCeption.delegate = self;

    [self.view addSubview:self.tableCeption];
    
    NSDictionary *views = @{@"tableView": self.tableCeption};
    
    self.tableCeption.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-22-[tableView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark BJTableCeption Delegate methods
- (CGFloat)tableCeption:(BJTableCeption *)tableCeption heightForRowForItem:(id)item
{
    if ([item isKindOfClass:[BJItemObject class]] > 0) {
        return 73;
    }
    return 36;
}

#pragma mark BJTableCeption Data Source

- (NSInteger)numberOfSectionsInTableView:(BJTableCeption *)tableCeption
{
    NSLog(@"Number of Sections: %i", [[self.tableCeption sections] count]);
    return [[self.tableCeption sections] count];
}

- (NSString *)tableCeption:(BJTableCeption *)tableCeption titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section: %i", section];
}

- (UITableViewCell *)tableCeption:(BJTableCeption *)tableCeption cellForItem:(id)item
{
    NSArray *topLevelObjects;
    BJTableCeptionExampleCell *cell;
    if ([item isKindOfClass:[BJItemObject class]]) {
        
        cell = (BJTableCeptionExampleCell *)[tableCeption dequeueReusableCellWithIdentifier:@"ItemListCell"];
        
        if (cell == nil) {
            topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BJTableCeptionExampleCells" owner:nil options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        cell.itemLabel.text = [((BJItemObject *)item) item];
        
        
        
    } else {
        cell = (BJTableCeptionExampleCell *)[tableCeption dequeueReusableCellWithIdentifier:@"CategoryHeaderCell"];
        
        if (cell == nil) {
            topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BJTableCeptionExampleCells" owner:nil options:nil];
            cell = [topLevelObjects objectAtIndex:1];
        }
        cell.categoryLabel.text = ((BJCategoryObject *)item).item;
    }
    
    return cell;
}

#pragma mark - Tableview index methods

- (id)tableCeptionItemForIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < 0) {
        return nil;
    }
    return [self tableCeptionItemForIndex:indexPath.row section:[self.tableCeption.sections objectAtIndex:indexPath.section]];
}

- (id)tableCeptionItemForIndex:(NSInteger)index section:(id)currentSection
{
    NSArray *sectionCategories = currentSection;
    NSMutableArray *flattenedArray = [NSMutableArray array];
    for (BJCategoryObject *category in sectionCategories) {
        [flattenedArray addObject:category];
        [flattenedArray addObjectsFromArray:category.children];
        
    }
    return [flattenedArray objectAtIndex:index];
}

@end
