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
#import "Book.h"

@implementation BooksListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [BookController sharedInstance].books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BookInListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookInListCell"];
    
    Book *book = [BookController sharedInstance].books[indexPath.row];
    
    cell.titleLabel.text = book.bookTitle;
    cell.authorLabel.text = book.bookAuthor;
    if ([book.hasRead isEqualToNumber:@1]) {
        cell.hasReadSwitch.on = YES;
    } else {
        cell.hasReadSwitch.on = NO;
    }
        
    return cell;
}

@end
