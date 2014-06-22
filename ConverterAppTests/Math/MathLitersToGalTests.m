//
//  MathLitersToGalTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathLitersToGal.h"

@interface MathLitersToGalTests : XCTestCase{
    MathLitersToGal* sut;
}

@end

@implementation MathLitersToGalTests

- (void)setUp
{
    [super setUp];
    sut = [MathLitersToGal new];
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
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 0.264172052, 0.000000001);
}

- (void)testReverseConvertNumberReturnsCorrectValue
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Act
    NSNumber* convertedNumber = [sut convertNumber:@0.264172052];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 1, 0.000000001);
}

- (void)testCorrectDescription
{
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Liters to Gallons"]);
}

- (void)testReverseCorrectDescription
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Gallons to Liters"]);
}

@end
