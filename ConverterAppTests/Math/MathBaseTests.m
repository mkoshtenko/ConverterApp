//
//  MathBaseTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/19/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MathBase.h"

@interface MathBaseTests : XCTestCase
{
    MathBase*   sut;
}

@end

@implementation MathBaseTests

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

- (void)testDefaultDirectionSetsToYESOnInit
{
    // Arrange
    MathBase *base = [MathBase new];
    // Act
    BOOL MathBaseDirection = [base defaultDirection];
    // Assert
    XCTAssertTrue(MathBaseDirection);
}

@end
