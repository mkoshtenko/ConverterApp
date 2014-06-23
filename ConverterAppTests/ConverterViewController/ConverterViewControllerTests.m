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
	XCTAssertNotNil(sut.convertButton, @"convertButton outlet should be connected");
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

- (void)testControllerRemovesObserverOnDealloc
{
    // Arrange
    id mock = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mock expect] removeObserver:sut];
    
    sut.notificationCenter = mock;
    
    // Act
    [sut dealloc];
    
    // Assert
    [mock verify];
}

- (void)testKeyboardShowsWhenControllerWillAppear
{
    // Arrange
    id mockObject = [OCMockObject mockForClass:[UITextField class]];
    [[mockObject expect] becomeFirstResponder];
    sut.textField = mockObject;
    
    // Act
    [sut viewWillAppear:YES];
    
    // Assert
    [mockObject verify];
}

- (void)testConvertButtonSendsConvertMessageToModel
{
    // Arrange
    id mockObject = [OCMockObject mockForClass:[ConverterModel class]];
    [[mockObject expect] convertValue];
    sut.model = mockObject;
    
    // Act
    [sut onConvertButton:nil];
    
    // Assert
    [mockObject verify];
}

- (void)testControllerSetsCorrectTextOnUpdate
{
    // Arrange
    ConverterModel* model = [ConverterModel new];
    sut.model = model;
    
    // Act
    [sut view];
    [sut viewDidLoad];
    [model updateWithText:@"2.83"];
    
    // Assert
    XCTAssertTrue([sut.textField.text isEqualToString:@"2.83"]);
}

- (void)testControllerDisablesConvertButtonOnModelDidUpdateNotificationIfTextIsEmpty
{
    // Arrange
    
    // Act
    [sut view];
    sut.convertButton.enabled = YES;
    [sut viewDidLoad];
    [[NSNotificationCenter defaultCenter] postNotificationName:kConverterModelDidUpdateNotification object:nil];
    
    // Assert
    XCTAssertFalse(sut.convertButton.enabled);
}

- (void)testControllerEnablesConvertButtonOnModelDidUpdateNotificationIfModelHasText
{
    // Arrange
    ConverterModel* model = [ConverterModel new];
    
    // Act
    [sut view];
    [sut viewDidLoad];
    sut.model = model;
    sut.convertButton.enabled = NO;
    [model updateWithText:@"2.67"];
    
    // Assert
    XCTAssertTrue(sut.convertButton.enabled);
}

- (void)testPickerHasTheSameNumberOfItemsAsMathObjectsInModel
{
    // Arrange
    ConverterModel* model = [ConverterModel new];
    sut.model = model;
    
    // Act
    
    // Assert
    XCTAssertTrue(model.mathModelList.count == [sut pickerView:nil numberOfRowsInComponent:0]);
}

- (void)testControllerReturnsCorrectTitleForPicker
{
    // Arrange
    ConverterModel* model = [ConverterModel new];
    sut.model = model;
    
    // Act
    
    // Assert
    XCTAssertTrue([[model.mathModelList[0] description] isEqualToString:[sut pickerView:nil titleForRow:0 forComponent:0]]);
}

- (void)testControllersChangesMathInModelWhenPickerDidSelectARow
{
    // Arrange
    ConverterModel* model = [ConverterModel new];
    sut.model = model;
    model.selectedMathModel = 0;
    
    // Act
    [sut pickerView:nil didSelectRow:1 inComponent:0];
    
    // Assert
    XCTAssertTrue(model.selectedMathModel==1);
}

- (void)testControllerUpdatesModelWithCorrectTextWhenChangedCharacterInRange
{
    // Arrange
    ConverterModel* model = [ConverterModel new];
    sut.model = model;
    UITextField* mockField = [UITextField new];
    mockField.text = @"2.84";
    
    // Act
    [sut textField:mockField shouldChangeCharactersInRange:NSMakeRange(0,0) replacementString:@""];
    
    // Assert
    XCTAssertTrue([model.text isEqualToString:@"2.84"]);
}


@end
