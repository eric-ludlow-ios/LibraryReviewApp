//
//  BooksListTableViewDataSource.h
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface BooksListTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;

@end
