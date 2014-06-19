//
//  ConverterViewControllerTests.m
//  ConverterApp
//
//  Created by maxim.k on 6/10/14.
//  All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ConverterViewController.h"
#import "ConverterModel.h"
#import "OCMock.h"

@interface ConverterViewControllerTests : XCTestCase
{
    ConverterViewController*   sut;
}

@end

@implementation ConverterViewControllerTests

- (void)setUp
{
    [super setUp];
    sut = [ConverterViewController new];
    sut.notificationCenter = [NSNotificationCenter defaultCenter];
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

- (void)testThatTextFieldOutletIsConnected
{
	[sut view];
	XCTAssertNotNil(sut.textField, @"textField outlet should be connected");
}

- (void)testThatPickerViewOutletIsConnected
{
	[sut view];
	XCTAssertNotNil(sut.pickerView, @"pickerView outlet should be connected");
}

- (void)testThatConvertButtonOutletIsConnected
{
	[sut view];
	XCTAssertNotNil(sut.convertButton, @"onvertButton outlet should be connected");
}

- (void)testViewDidLoadAddsObserver
{
    // Arrange
    id mock = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mock expect] addObserver:sut
                      selector:[OCMArg anySelector]
                          name:kConverterModelDidUpdateNotification
                        object:OCMOCK_ANY];
    
    sut.notificationCenter = mock;

    // Act
    [sut viewDidLoad];
    
    // Assert
    [mock verify];
}

- (void)testControllerRemovesOnserverOnDealloc
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testKeyboardShowsWhenControllerWillAppear
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testConvertButtonSendsConvertMessageToModel
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testConterollerSetsCorrectTextOnUpdate
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testControllerDisablesConvertButtonOnModelDidUpdateNotificationIfTextIsEmpty
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testControllerEnablesConvertButtonOnModelDidUpdateNotificationIfModelHasText
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testPickerHasTheSameNumberOfItemsAsMathObjectsInModel
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testControllerReturnsCorrectTitleForPicker
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testControllersChangesMathInModelWhenPickerDidSelectARow
{
    // Arrange
    
    // Act
    
    // Assert
}

- (void)testControllerUpdatesModelWithCorrectTextWhenChangedCharacterInRange
{
    // Arrange
    
    // Act
    
    // Assert
}


@end
