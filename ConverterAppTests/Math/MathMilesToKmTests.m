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

@end

@implementation MathMilesToKmTests

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
    MathMilesToKm *MathMilesToKmInstance = [MathMilesToKm new];
    
    // Act
    
    // Dictionary with test data, where 'key' is from and 'value' is to.
    NSDictionary *dataToTest = @{
        [NSNumber numberWithFloat:10.f]:[NSNumber numberWithFloat:16.09f],
        [NSNumber numberWithFloat:.0f]:[NSNumber numberWithFloat:.0f],
        [NSNumber numberWithFloat:100.f]:[NSNumber numberWithFloat:160.9f],
    };
    
    // Assert
    for(NSNumber *key in dataToTest){
        NSNumber *from = key;
        NSNumber *to = [dataToTest objectForKey:key];
        XCTAssertEqualWithAccuracy([MathMilesToKmInstance convertNumber:from].floatValue, to.floatValue, accuracy);
    }
}

@end
