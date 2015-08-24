//
//  BooksListTableViewDataSource.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "BooksListTableViewDataSource.h"
#import "BookInListTableViewCell.h"

@implementation BooksListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BookInListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookInListCell"];
    
    //configure cell
    
    return cell;
}

@end
