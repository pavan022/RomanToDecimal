//
//  RomanToDecimalConverter.m
//  RomanToDecimal
//
//  Created by Sai Reddy on 10/3/15.
//  Copyright (c) 2015 Sai Reddy. All rights reserved.
//

#import "RomanToDecimalConverter.h"

@interface RomanToDecimalConverter ()
- (int) getDecimalValueForRomanNumber: (char)romanNumerical;
@end

@implementation RomanToDecimalConverter

/*
 romanToDecimal
 Method converts the romanNumber string value to decimal and stores the result in decimalNumber variable.
 */

-(int) romanToDecimal: (NSString *)romanNumber {
    
    char char1, char2;
    int digit1 = 0, digit2 = 0, result = 0;
    BOOL flag;
        romanNumber = [[[romanNumber componentsSeparatedByString:@" "] componentsJoinedByString:@""] lowercaseString];
        for (NSInteger i = 0; i < romanNumber.length; i++) {
            flag = true;
            char1 = [romanNumber characterAtIndex:i];
            digit1 = [self getDecimalValueForRomanNumber:char1];
            if ( i < romanNumber.length - 1) {
                char2 = [romanNumber characterAtIndex:i+1];
                digit2 = [self getDecimalValueForRomanNumber:char2];
                if(digit1 < digit2) flag = false;
            }
            if(digit1 == 0)
                result = 0;
            if(flag == true)
                result += digit1;
            else
                result -= digit1;
            if (result > INT16_MAX) {
                result = -1;
                NSException *resultOutOfRangeException = [NSException exceptionWithName: @"ResultRangeExceededException" reason: @"Resultant decimal value has exceeded INT16_MAX range" userInfo:nil];
                [resultOutOfRangeException raise];
            }
        }
        return result;
}

/*
    getDecimalValueForRomanNumber
    Method takes an 'character' and returns its respective decimal value which is an integer.
*/

-(int) getDecimalValueForRomanNumber :(char)romanNumerical {
    NSDictionary *romanDecimalList = @{
                                       @"i" : [NSNumber numberWithInt:1],
                                       @"v" : [NSNumber numberWithInt:5],
                                       @"x" : [NSNumber numberWithInt:10],
                                       @"l" : [NSNumber numberWithInt:50],
                                       @"c" : [NSNumber numberWithInt:100],
                                       @"d" : [NSNumber numberWithInt:500],
                                       @"m" : [NSNumber numberWithInt:1000]
                                       };
    return [[romanDecimalList objectForKey: [NSString stringWithFormat:@"%c",romanNumerical]] intValue];
}

@end
