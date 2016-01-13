//
//  ViewController.m
//  Twitterizer
//
//  Created by Jerry on 1/13/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property NSArray *vowels;

@property (weak, nonatomic) IBOutlet UILabel *charactersTyped;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.delegate = self;
    self.vowels = [[NSArray alloc] initWithObjects:@"a",@"A",@"e",@"E",@"i",@"I",@"o",@"O",@"u",@"U", nil];
}

-(void)textViewDidChange:(UITextView *)textView
{
    NSUInteger length;
    length = [textView.text length];
    self.charactersTyped.text = [NSString stringWithFormat:@"%lu", length];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return textView.text.length + (text.length - range.length) <= 140;
}

- (IBAction)twitterizeButton:(UIButton *)sender {
    NSString *text = self.textView.text;
    NSMutableString *consonant = [NSMutableString new];
    NSUInteger length = text.length;
    
    for (int i = 0; i < length; i++) {
        if (![self.vowels containsObject: [NSString stringWithFormat:@"%c",[text characterAtIndex:i]]]) {
            [consonant appendString:[NSString stringWithFormat:@"%c", [text characterAtIndex:i]]];
        }
    }
    self.textView.text = consonant;
    [self textViewDidChange:self.textView];
}

@end
