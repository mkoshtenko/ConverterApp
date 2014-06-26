//
//  MathInchesToCmTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathInchesToCm.h"


@interface MathInchesToCmTests : XCTestCase

@end

@implementation MathInchesToCmTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvertNumberReturnsCorrectValue
{
    // Arrange
    const float accuracy = .1f;
    MathInchesToCm *MathInchesToCmInstance = [MathInchesToCm new];
    // Act
    
    // Dictionary with test data, where 'key' is from and 'value' is to.
    NSDictionary *dataToTest = @{
                                 [NSNumber numberWithFloat:12.f]:[NSNumber numberWithFloat:30.48f],
                                 [NSNumber numberWithFloat:.0f]:[NSNumber numberWithFloat:.0f],
                                 [NSNumber numberWithFloat:44.f]:[NSNumber numberWithFloat:111.8f],
                                 [NSNumber numberWithFloat:3.6f]:[NSNumber numberWithFloat:9.1f],
                                 };

    // Assert
    for(NSNumber *key in dataToTest){
        NSNumber *from = key;
        NSNumber *to = [dataToTest objectForKey:key];
        XCTAssertEqualWithAccuracy([MathInchesToCmInstance convertNumber:from].floatValue, to.floatValue, accuracy, @"");
    }
}

@end
