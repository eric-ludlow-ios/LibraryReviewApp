//
//  EditBookDetailViewController.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "EditBookDetailViewController.h"
#import "BookController.h"

@interface EditBookDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *summaryField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingSegCon;
@property (weak, nonatomic) IBOutlet UISwitch *hasReadSwitch;
@property (weak, nonatomic) IBOutlet UITextView *reviewTextView;
@property (nonatomic)UITextView *activeView;

@end

@implementation EditBookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self registerForKeyboardNotifications];
}

- (IBAction)cancelButtonPressed:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonPressed:(id)sender {
    
    if (!self.book) {
        self.book = [[BookController sharedInstance] createBook];
    }
    
    self.book.bookTitle = self.titleField.text;
    self.book.bookAuthor = self.authorField.text;
    self.book.bookSummary = self.summaryField.text;
    self.book.myRating = [NSNumber numberWithInteger:self.ratingSegCon.selectedSegmentIndex];
    self.book.myReview = self.reviewTextView.text;
    if (self.hasReadSwitch.on) {
        self.book.hasRead = @1;
    } else {
        self.book.hasRead = @0;
    }
    
    [[BookController sharedInstance] save];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.reviewTextView.contentInset = contentInsets;
    self.reviewTextView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeView.frame.origin) ) {
        [self.reviewTextView scrollRectToVisible:self.activeView.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.reviewTextView.contentInset = contentInsets;
    self.reviewTextView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextView *)textView
{
    self.activeView = textView;
}

- (void)textFieldDidEndEditing:(UITextView *)textView
{
    self.activeView = nil;
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
