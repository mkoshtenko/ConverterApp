//
//  MathLitersToGalTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathLitersToGal.h"


@interface MathLitersToGalTests : XCTestCase

@end

@implementation MathLitersToGalTests

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
    MathLitersToGal *MathLitersToGalInstance = [MathLitersToGal new];
    // Act
    
    // Dictionary with test data, where 'key' is from and 'value' is to.
    NSDictionary *dataToTest = @{
                                 [NSNumber numberWithFloat:2.645f]:[NSNumber numberWithFloat:.7f],
                                 [NSNumber numberWithFloat:.0f]:[NSNumber numberWithFloat:.0f],
                                 [NSNumber numberWithFloat:.3f]:[NSNumber numberWithFloat:.08f],
                                 };
    
    // Assert
    for(NSNumber *key in dataToTest){
        NSNumber *from = key;
        NSNumber *to = [dataToTest objectForKey:key];
        XCTAssertEqualWithAccuracy([MathLitersToGalInstance convertNumber:from].floatValue, to.floatValue, accuracy, @"");
    }

}

@end
