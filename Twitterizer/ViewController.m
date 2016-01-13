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
- (IBAction)hashTagButton:(UIButton *)sender {
    NSArray *words = [self.textView.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableString *hashedString = [NSMutableString new];
    for(int i = 0; i < words.count; i++) {
        if (i%2 == 0) {
            [hashedString appendString:[NSString stringWithFormat:@"#%@ ", [words objectAtIndex:i]]];
        } else {
            [hashedString appendString:[NSString stringWithFormat:@"%@ ", [words objectAtIndex:i]]];
        }
    }
    NSString *doneString = [[NSString stringWithString:hashedString] substringToIndex:[hashedString length] - 1];
    self.textView.text = doneString;
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
