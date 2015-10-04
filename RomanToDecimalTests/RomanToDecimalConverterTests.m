//
//  RomanToDecimalConverterTests.m
//  RomanToDecimal
//
//  Created by Sai Reddy on 10/4/15.
//  Copyright (c) 2015 Sai Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "RomanToDecimalConverter.h"

@interface RomanToDecimalConverterTests : XCTestCase
@property (nonatomic) RomanToDecimalConverter *converterToTest;
@end

@implementation RomanToDecimalConverterTests

- (void)setUp {
    [super setUp];
    self.converterToTest = [[RomanToDecimalConverter alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

/*
 testInit
 test the creation of converter object
*/
-(void) testInit {
    XCTAssertNotNil(self.converterToTest);
}

/*
 testRomanToDecimalWithMaximumDecimalOutputShouldRaiseException:
    Input a Roman value which results in decimal exceeding INT16_MAX value should raise an exception.
*/
-(void) testRomanToDecimalWithMaximumDecimalOutputShouldRaiseException {
    NSMutableString *romanInput = [NSMutableString string];
    for (int i = 1; i < INT16_MAX/10 ; i++) {
        [romanInput appendString:@"MMMMMMMMMMM"];
    }
    XCTAssertThrowsSpecificNamed([self.converterToTest romanToDecimal:romanInput], NSException, @"ResultRangeExceededException", @"Should raise Result Range Exceeded Exception");
}

/*
 testRomanToDecimalWithMaximumDecimalOutputShouldReturnMinusOne:
 Input a Roman value which results in decimal exceeding INT16_MAX value should return -1.
*/
-(void) testRomanToDecimalWithMaximumDecimalOutputShouldReturnMinusOne {
    //Build a romanInput where resultant Decimal number is more that INT16_MAX value and result should be -1.
    @try {
        NSMutableString *romanInput = [NSMutableString string];
        for (int i = 1; i < INT16_MAX/10 ; i++) {
            [romanInput appendString:@"MMMMMMMMMMM"];
        }
        int expectedDecimalNumber = -1;
        int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
        XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber);
    }
    @catch (NSException *exception) {
        if([exception.name  isEqual: @"ResultRangeExceededException"])
            NSLog(@"Caught -- ResultRangeExceededException");
    }
}

/*
 testRomanToDecimalWithValidInput:
 Input a Roman value which is valid (LLL) and result is 150.
*/
- (void)testRomanToDecimalWithValidInput {
    NSString *romanInput = @"LLL";
    int expectedDecimalNumber = 150;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 150");
}

/*
 testRomanToDecimalWithValidInputWithSpaces:
 Input a Roman value which is valid (XX XX) and result is 40.
*/
- (void)testRomanToDecimalWithValidInputWithSpaces {
    NSString *romanInput = @"XX XX";
    int expectedDecimalNumber = 40;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 40");
}

/*
 testRomanToDecimalWithValidLowerCaseInput:
 Input a Roman value which is valid lower case letters(ccmcc) and result is 1200.
*/
- (void)testRomanToDecimalWithValidLowerCaseInput {
    NSString *romanInput = @"ccmcc";
    int expectedDecimalNumber = 1200;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 1200");
}

/*
 testRomanToDecimalWithInputCombinationOfUpperAndLowerCase:
 Input a Roman value which is valid lower case & upper case combinationletters(ccm CC) and result is 1200.
*/
- (void)testRomanToDecimalWithInputCombinationOfUpperAndLowerCase {
    NSString *romanInput = @"ccm CC";
    int expectedDecimalNumber = 1200;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 1200");
}

/*
 testRomanToDecimalWithNilInput:
 Input a Roman value which is nil and result should return 0.
*/
- (void)testRomanToDecimalWithNilInput {
    NSString *romanInput = nil;
    int expectedDecimalNumber = 0;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 0");
}

/*
 testRomanToDecimalWithInvalidInputOfNumbers:
 Input a Roman value which is invalid(digits) and result should return 0.
*/
- (void)testRomanToDecimalWithInvalidInputOfNumbers {
    NSString *romanInput = @"9901";
    int expectedDecimalNumber = 0;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 0");
}

/*
 testRomanToDecimalWithInvalidInputOfNegativeNumbers:
 Input a Roman value which is invalid( -ve digits) and result should return 0.
*/
- (void)testRomanToDecimalWithInvalidInputOfNegativeNumbers {
    NSString *romanInput = @"-9901";
    int expectedDecimalNumber = 0;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 0");
}

/*
 testRomanToDecimalWithInvalidInputOfSymbols:
 Input a Roman value which is invalid(symbols) and result should return 0.
*/
- (void)testRomanToDecimalWithInvalidInputOfSymbols {
    NSString *romanInput = @"** !";
    int expectedDecimalNumber = 0;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 0");
}

/*
 testRomanToDecimalWithInvalidInputOfEmptyString:
 Input a Roman value which is invalid(empty string) and result should return 0.
*/
- (void)testRomanToDecimalWithInvalidInputOfEmptyString {
    NSString *romanInput = @"";
    int expectedDecimalNumber = 0;
    int resultantDecimalNumber = [self.converterToTest romanToDecimal:romanInput];
    XCTAssertEqual(expectedDecimalNumber, resultantDecimalNumber, @"Should return 0");
}

@end
