//
//  ViewController.m
//  RomanToDecimal
//
//  Created by Sai Reddy on 10/3/15.
//  Copyright (c) 2015 Sai Reddy. All rights reserved.
//

#import "ViewController.h"
#import "RomanToDecimalConverter.h"

@interface ViewController ()
@property (strong) RomanToDecimalConverter *converter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.converter = [[RomanToDecimalConverter alloc] init];
}

/*
 Click handler for Convert to Decimal Button
 Converts the Roman Input to Decimal and displays the result.
*/
- (IBAction)RomanToDecimalClickHandler {
    self.romanInput.text = [self.romanInput.text uppercaseString];
    int resultDecimalNumber = [self.converter romanToDecimal:self.romanInput.text];
    if(resultDecimalNumber == 0)
        self.decimalOutput.text = @"Invalid Roman Input";
    else if(resultDecimalNumber == -1)
        self.decimalOutput.text = @"Ouput Number Range Exceeded";
    else
        self.decimalOutput.text = [NSString stringWithFormat:@"%d",resultDecimalNumber];
}
@end
