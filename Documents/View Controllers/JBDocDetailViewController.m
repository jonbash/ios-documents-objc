//
//  JBDocDetailViewController.m
//  Documents
//
//  Created by Jon Bash on 2020-01-22.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBDocDetailViewController.h"
#import "JBDocumentController.h"

@interface JBDocDetailViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *wordCountLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *titleTextField;
@property (unsafe_unretained, nonatomic) IBOutlet UITextView *bodyTextView;

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;

- (void)saveDocument;
- (void)updateViews;

@end

@implementation JBDocDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateViews];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [self saveDocument];
}

- (void)saveDocument {
    if (([self.titleTextField.text length] == 0) || ([self.bodyTextView.text length] == 0)) {
        return;
    }

    if (self.document) {
        [self.documentController updateDocument:self.document
                                   withNewTitle:self.titleTextField.text
                                           body:self.bodyTextView.text];
    } else {
        [self.documentController createDocumentWithTitle:self.titleTextField.text
                                                    body:self.bodyTextView.text];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)updateViews {
    if (self.document) {
        // TODO: configure subviews for doc data
    } else {
        // TODO: configure subviews for new doc
    }
}

@end
