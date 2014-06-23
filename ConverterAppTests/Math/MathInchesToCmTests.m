//
//  MathInchesToCmTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathInchesToCm.h"

@interface MathInchesToCmTests : XCTestCase{
    MathInchesToCm* sut;
}

@end

@implementation MathInchesToCmTests

- (void)setUp
{
    [super setUp];
    sut = [MathInchesToCm new];
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
    NSNumber* convertedNumber = [sut convertNumber:@1];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 2.54, 0.01);
}

- (void)testReverseConvertNumberReturnsCorrectValue
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Act
    NSNumber* convertedNumber = [sut convertNumber:@2.54];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 1, 0.01);
}

- (void)testCorrectDescription
{
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Inches to Centimeters"]);
}

- (void)testReverseCorrectDescription
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Centimeters to Inches"]);
}

@end
