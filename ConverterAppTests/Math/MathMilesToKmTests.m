//
//  MathMilesToKmTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathMilesToKm.h"

@interface MathMilesToKmTests : XCTestCase
{
    MathMilesToKm* sut;
}
@end

@implementation MathMilesToKmTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    sut = [MathMilesToKm new];
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
    NSNumber* convertedNumber = [sut convertNumber:@3];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 3*1.609344, 0.000001);
}

- (void)testReverseConvertNumberReturnsCorrectValue
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Act
    NSNumber* convertedNumber = [sut convertNumber:@1.609344];
    
    // Assert
    XCTAssertEqualWithAccuracy([convertedNumber doubleValue], 1, 0.000001);
}

- (void)testCorrectDescription
{
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Miles to Kilometers"]);
}

- (void)testReverseCorrectDescription
{
    // Arrange
    sut.defaultDirection = NO;
    
    // Assert
    XCTAssertTrue([sut.description isEqualToString:@"Kilometers to Miles"]);
}

@end
