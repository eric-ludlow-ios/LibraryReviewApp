//
//  Book.h
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * bookTitle;
@property (nonatomic, retain) NSString * bookAuthor;
@property (nonatomic, retain) NSString * bookSummary;
@property (nonatomic, retain) NSNumber * myRating;
@property (nonatomic, retain) NSString * coverImageFileName;
@property (nonatomic, retain) NSNumber * isReading;
@property (nonatomic, retain) NSNumber * hasRead;
@property (nonatomic, retain) NSString * myReview;

@end
