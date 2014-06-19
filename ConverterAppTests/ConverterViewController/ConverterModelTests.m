//
//  ConverterModelTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/10/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ConverterModel_Internal.h"

@interface ConverterModelTests : XCTestCase
{
    ConverterModel* sut;
}

@end

@implementation ConverterModelTests

- (void)setUp
{
    [super setUp];
    
    sut = [ConverterModel new];
}

- (void)tearDown
{
    sut = nil;
    
    [super tearDown];
}

- (void)testModelHasMathListAfterInit
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testListOfDefaultModelsReturnsAnArrayWithMathObjects
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testCurrentMathModelReturnsCorrectResult
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testConvertedValueWithMathModelReturnsCorrectResult
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testConvertValueUpdatesSelfWithCorrectText
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testUpdateWithTextCreatesFormatterIfItIsNil
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testUpdateWithTextAllowsNumbersWithDot
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testUpdateWithTextUpdatesText
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testUpdateWithTextUpdatesValue
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testUpdateWithTextAlwaysPostsUpdateNotification
{
    // Arrange
    
    // Act
    
    // Assert
}


@end
