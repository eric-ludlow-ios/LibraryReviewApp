//
//  BookInListTableViewCell.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "BookInListTableViewCell.h"

@implementation BookInListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//wire up the toggle switch; implement the flip method to call the delegate method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
