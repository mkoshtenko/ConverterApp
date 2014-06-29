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

@end

@implementation MathCelsiusToKTests

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
    MathCelsiusToK *MathCelsiusToKInstance = [MathCelsiusToK new];
    // Act
    
    // Dictionary with test data, where 'key' is from and 'value' is to.
    NSDictionary *dataToTest = @{
                                 [NSNumber numberWithFloat:12.f]:[NSNumber numberWithFloat:285.2f],
                                 [NSNumber numberWithFloat:362.6f]:[NSNumber numberWithFloat:635.8f],
                                 [NSNumber numberWithFloat:-31.2f]:[NSNumber numberWithFloat:242.f],
                                 };

    // Assert
    for(NSNumber *key in dataToTest){
        NSNumber *from = key;
        NSNumber *to = [dataToTest objectForKey:key];
        XCTAssertEqualWithAccuracy([MathCelsiusToKInstance convertNumber:from].floatValue, to.floatValue, accuracy);
    }
}

@end
