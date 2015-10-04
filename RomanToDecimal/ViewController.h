//
//  ViewController.h
//  RomanToDecimal
//
//  Created by Sai Reddy on 10/3/15.
//  Copyright (c) 2015 Sai Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *romanInput;

@property (weak, nonatomic) IBOutlet UITextField *decimalOutput;

- (IBAction)RomanToDecimalClickHandler;

@end

