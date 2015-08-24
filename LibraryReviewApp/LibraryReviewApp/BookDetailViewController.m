//
//  BookDetailViewController.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "BookDetailViewController.h"
#import "EditBookDetailViewController.h"

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
    self.reviewTextView.text = self.book.myReview;
    if ([self.book.hasRead isEqualToNumber:@0]) {
        self.hasReadSwitch.on = NO;
    } else {
        self.hasReadSwitch.on = YES;
    }
    self.hasReadSwitch.enabled = NO;
    
    switch (self.book.myRating.integerValue) {
        case 0:
            self.ratingLabel.text = @"Rating: none";
            break;
        case 1:
            self.ratingLabel.text = @"Rating: ☆";
            break;
        case 2:
            self.ratingLabel.text = @"Rating: ☆☆";
            break;
        case 3:
            self.ratingLabel.text = @"Rating: ☆☆☆";
            break;
        case 4:
            self.ratingLabel.text = @"Rating: ☆☆☆☆";
            break;
        case 5:
            self.ratingLabel.text = @"Rating: ☆☆☆☆☆";
            break;

        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editBook"]) {
        
        UINavigationController *navCon = segue.destinationViewController;
        EditBookDetailViewController *destinationEditBookDetailVC = (EditBookDetailViewController *)(navCon.topViewController);
        
        destinationEditBookDetailVC.book = self.book;
    }
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
