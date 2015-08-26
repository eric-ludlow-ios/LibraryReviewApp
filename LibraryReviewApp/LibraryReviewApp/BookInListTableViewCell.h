//
//  BookInListTableViewCell.h
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>

//delegate protocol
@protocol BookInListTableViewCellSwitchDelegate;


@interface BookInListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UISwitch *hasReadSwitch;

//delegate property
@property (weak, nonatomic) id<BookInListTableViewCellSwitchDelegate> delegate;

@end

//full delegate protocol, incl. method statement
@protocol BookInListTableViewCellSwitchDelegate <NSObject>

- (void)cellSwitchFlipped:(BookInListTableViewCell *)cellWithFlippedSwitch;

@end