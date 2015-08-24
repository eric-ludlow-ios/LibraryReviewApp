//
//  BookInListTableViewCell.h
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>

//delegate protocol

@interface BookInListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UISwitch *hasReadSwitch;

//delegate property

@end

//full delegate protocol, incl. method statement