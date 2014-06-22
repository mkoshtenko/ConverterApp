//
//  MathCelsiusToKTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathCelsiusToK.h"

@interface MathCelsiusToKTests : XCTestCase
{
    MathCelsiusToK* sut;
}

@end

@implementation MathCelsiusToKTests

- (void)setUp
{
    [super setUp];
    sut = [MathCelsiusToK new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    sut = nil;
}

- (void)testConvertNumberReturnsCorrectValue
{
    // Act
    NSNumber* convertedNumber = [sut convertNumber:@0];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 274.15, 0.01);
}

- (void)testReverseConvertNumberReturnsCorrectValue
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Act
    NSNumber* convertedNumber = [sut convertNumber:@274.15];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 0, 0.01);
}

- (void)testCorrectDescription
{
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Celsius to Kelvins"]);
}

- (void)testReverseCorrectDescription
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Kelvins to Celsius"]);
}

@end
