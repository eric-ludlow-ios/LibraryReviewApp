//
//  BookDetailViewController.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "BookDetailViewController.h"

@interface BookDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UISwitch *hasReadSwitch;
@property (weak, nonatomic) IBOutlet UITextView *reviewTextView;

@end

@implementation BookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.titleLabel.text = self.book.bookTitle;
    self.authorLabel.text = self.book.bookAuthor;
    self.summaryLabel.text = self.book.bookSummary;
    self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %@", self.book.myRating];
    self.reviewTextView.text = self.book.myReview;
    if ([self.book.hasRead isEqualToNumber:@0]) {
        self.hasReadSwitch.on = NO;
    } else {
        self.hasReadSwitch.on = YES;
    }
    self.hasReadSwitch.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
