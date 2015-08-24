//
//  BookController.h
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface BookController : NSObject

+ (BookController *)sharedInstance;

- (Book *)createBook;

@property (strong, nonatomic)NSArray *books;

//update: pointers and save

- (void)deleteBook:(Book *)bookToDelete;

@end
