//
//  ConverterModelTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/10/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ConverterModel_Internal.h"
#import "MathBase.h"
#import "OCMock.h"

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
    // Assert
    XCTAssertNotNil(sut.mathModelList);
}

- (void)testListOfDefaultModelsReturnsAnArrayWithMathObjects
{
    // Assert
    for (NSObject* obj in sut.mathModelList) {
        XCTAssertTrue([obj isKindOfClass:[MathBase class]]);
    }
}

- (void)testCurrentMathModelReturnsCorrectResult
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Assert
    XCTAssertTrue([sut.currentMathModel isKindOfClass:[MathBase class]]);
}

- (void)testConvertedValueWithMathModelReturnsCorrectResult
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@"2.0"];
    
    // Assert
    XCTAssertNotNil([sut convertedValueWithMathModel:[sut currentMathModel]]);
}

- (void)testConvertValueUpdatesSelfWithCorrectText
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@"2.0"];
    [sut convertValue];
    
    // Assert
    XCTAssertNotEqualWithAccuracy([[sut valueForKey:@"_value"] doubleValue], 2, 0.1);
}

- (void)testUpdateWithTextCreatesFormatterIfItIsNil
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@"2.0"];
    
    // Assert
    XCTAssertNotNil([sut valueForKey:@"_numberFormatter"]);
}

- (void)testUpdateWithTextAllowsNumbersWithDot
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@"2."];
    [sut convertValue];
    
    // Assert
    XCTAssertNotNil([sut valueForKey:@"_value"]);
}

- (void)testUpdateWithTextUpdatesText
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@"2"];
    
    // Assert
    XCTAssertNotNil([sut valueForKey:@"_text"]);
}

- (void)testUpdateWithTextUpdatesValue
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@"2.5"];
    
    // Assert
    XCTAssertNotNil([sut valueForKey:@"_value"]);
}

- (void)testUpdateWithTextAlwaysPostsUpdateNotification
{
    // Arrange
    NSString* notificationName = kConverterModelDidUpdateNotification;
    id observerMock = [OCMockObject observerMock];
    [[NSNotificationCenter defaultCenter] addMockObserver:observerMock name:notificationName object:sut];
    [[observerMock expect] notificationWithName:notificationName object:sut];
    
    // Act
    sut.selectedMathModel = 1;
    [sut updateWithText:@"2.5"];
    
    // Assert
    [observerMock verify];
    [[NSNotificationCenter defaultCenter] removeObserver:observerMock];
}


@end
