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
#import "MathLitersToGal.h"
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
    // Arrange
    BOOL ModelHasMathListAfterInit = [sut mathModelList] != nil && [[sut mathModelList] count] != 0;
    // Act
    
    // Assert
    XCTAssert(ModelHasMathListAfterInit);
}

- (void)testListOfDefaultModelsReturnsAnArrayWithMathObjects
{
    // Arrange
    NSArray *list = [sut mathModelList];
    int MathObjectsCount = 0;
    // Act
    for(id object in list){
        if([object isKindOfClass:[MathBase class]]){
            ++MathObjectsCount;
        }
    }
    // Assert
    XCTAssertEqual(MathObjectsCount, [list count]);
}

- (void)testCurrentMathModelReturnsCorrectResult
{
    // Arrange
    
    // Act
    
    //Select second(LitersToGal) math model
    sut.selectedMathModel = 1;
    
    //Get selected math model
    id<MathProtocol> CurrentMathModel = [sut currentMathModel];
    
    // Assert
    XCTAssert([CurrentMathModel isKindOfClass:[MathLitersToGal class]]);
}

- (void)testConvertedValueWithMathModelReturnsCorrectResult
{
    // Arrange
    const float accuracy = .1f;
    //Select second(LitersToGal) math model
    sut.selectedMathModel = 1;
    
    // Act
    NSNumber *convertedValue = [[sut currentMathModel] convertNumber:[NSNumber numberWithFloat:.3f]];
    
    // Assert
    XCTAssertEqualWithAccuracy(convertedValue.floatValue, .08f, accuracy);
}

- (void)testConvertValueUpdatesSelfWithCorrectText
{
    // Arrange
    
    //Select second(LitersToGal) math model
    sut.selectedMathModel = 1;
    [sut updateWithText:@"4.3"];

    // Act
    [sut convertValue];
    NSString *convertedString = [sut text];
    
    // Assert
    XCTAssert([convertedString isEqualToString:@"1.13594" ]);
    
}

- (void)testUpdateWithTextCreatesFormatterIfItIsNil
{
    // Arrange
    sut.selectedMathModel = 1;
    
    // Act
    [sut updateWithText:@".3"];
    id formatter = [sut valueForKey:@"_numberFormatter"];
    
    // Assert
    XCTAssertNotNil(formatter);
    
}

- (void)testUpdateWithTextAllowsNumbersWithDot
{
    
    
    // Arrange
    sut.selectedMathModel = 2;
    
    // Act
    [sut updateWithText:@".4"];
    [sut convertValue];
    
    NSString *result = [sut text];
    // Assert
    XCTAssertEqualObjects(result, @"1.016");
}

- (void)testUpdateWithTextUpdatesText
{
    // Arrange
    
    // Act
    [sut updateWithText:@"666"];
    NSString *toAssert = [sut text];
    // Assert
    XCTAssertEqualObjects(toAssert, @"666");
}

- (void)testUpdateWithTextUpdatesValue
{
    // Arrange
    sut.selectedMathModel = 3;
    // Act
    [sut updateWithText:@"130"];
    NSNumber *value = [sut valueForKey:@"_value"];
    // Assert
    XCTAssertEqualObjects(value, [NSNumber numberWithInt:130]);
    
}

- (void)testUpdateWithTextAlwaysPostsUpdateNotification
{
    // Arrange

    sut.selectedMathModel = 3;
    
    id myMock = [OCMockObject observerMock];
    [[NSNotificationCenter defaultCenter] addMockObserver:myMock
                                                     name:kConverterModelDidUpdateNotification
                                                   object:sut];
    
    [[myMock expect] notificationWithName:kConverterModelDidUpdateNotification
                                         object:sut];
    
    // Act
    
    [sut updateWithText:@"16.36"];
    
    // Assert
    [myMock verify];
    [[NSNotificationCenter defaultCenter] removeObserver:myMock];
}


@end
