//
//  ViewController.m
//  Twitterizer
//
//  Created by Jerry on 1/13/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *vowels;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vowels = [[NSArray alloc] initWithObjects:@"a", @"e", @"i", @"o", @"u", nil];
    // Do any additional setup after loading the view, typically from a nib.
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
}

@end
