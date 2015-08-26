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
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end

@implementation EditBookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self registerForKeyboardNotifications];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.book) {
        self.hasReadSwitch.on = NO;
    }
    
    if (self.book) {
        self.titleField.text = self.book.bookTitle;
        self.authorField.text = self.book.bookAuthor;
        self.summaryField.text = self.book.bookSummary;
        self.ratingSegCon.selectedSegmentIndex = [self.book.myRating integerValue];
        self.reviewTextView.text = self.book.myReview;
        if ([self.book.hasRead isEqualToNumber:@0]) {
            self.hasReadSwitch.on = NO;
        } else {
            self.hasReadSwitch.on = YES;
        }
    }
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
- (void)keyboardWasShown:(NSNotification*)aNotification {
    
    NSDictionary *info = [aNotification userInfo];
    CGFloat keyboardHeight = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    CGFloat deleteButtonHeight = self.deleteButton.frame.size.height;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardHeight - deleteButtonHeight - 20.0, 0.0);
    
    self.reviewTextView.contentInset = contentInsets;
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.reviewTextView.contentInset = contentInsets;
}

//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    if ([textView.text isEqualToString:@"placeholder text here..."]) {
//        textView.text = @"";
//        textView.textColor = [UIColor blackColor]; //optional
//    }
//    [textView becomeFirstResponder];
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    if ([textView.text isEqualToString:@""]) {
//        textView.text = @"placeholder text here...";
//        textView.textColor = [UIColor lightGrayColor]; //optional
//    }
//    [textView resignFirstResponder];
//}
//just remember to set myUITextView with the exact text on creation e.g.
//
//UITextView *myUITextView = [[UITextView alloc] init];
//myUITextView.delegate = self;
//myUITextView.text = @"placeholder text here...";
//myUITextView.textColor = [UIColor lightGrayColor]; //optional
//and make the parent class a UITextViewDelegate before including these methods e.g.
//
//@interface MyClass () <UITextViewDelegate>
//@end


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
