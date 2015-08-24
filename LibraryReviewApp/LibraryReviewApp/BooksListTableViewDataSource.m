//
//  BooksListTableViewDataSource.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "BooksListTableViewDataSource.h"
#import "BookInListTableViewCell.h"
#import "BookController.h"

//cell delegate

@implementation BooksListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    self.tableView = tableView;
    
    return [BookController sharedInstance].books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BookInListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookInListCell"];
    
    //set cell's delegate to self
    
    Book *book = [BookController sharedInstance].books[indexPath.row];
    
    cell.titleLabel.text = book.bookTitle;
    cell.authorLabel.text = book.bookAuthor;
    if ([book.hasRead isEqualToNumber:@0]) {
        cell.hasReadSwitch.on = NO;
    } else {
        cell.hasReadSwitch.on = YES;
    }
        
    return cell;
}

//delegate method

@end
