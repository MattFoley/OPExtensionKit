//
//  UITableView+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 5/24/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "UITableView+Opetopic.h"

UITableViewRowAnimation UITableViewRowAnimationAutomaticOr(UITableViewRowAnimation rowAnimation) {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
        return UITableViewRowAnimationAutomatic;
    return rowAnimation;
}

@implementation UITableView (Opetopic)

-(NSArray*) indexPathsInSection:(NSUInteger)section {
    NSMutableArray *retVal = [NSMutableArray new];
    for (NSUInteger row = 0; row < [self.dataSource tableView:self numberOfRowsInSection:section]; row++)
        [retVal addObject:[NSIndexPath indexPathForRow:row inSection:section]];
    return retVal;
}

-(NSArray*) allIndexPaths {
    NSMutableArray *retVal = [NSMutableArray new];
    for (NSUInteger section = 0; section < [self.dataSource numberOfSectionsInTableView:self]; section++)
        [retVal addObjectsFromArray:[self indexPathsInSection:section]];
    return retVal;
}

@end