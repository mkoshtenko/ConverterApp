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
//    // Arrange
//    id myMock = [OCMockObject mockForClass:[NSNotificationCenter class]];
//    sut.notificationCenter = myMock;
//    
//    // Act
//    [[myMock expect] removeObserver:sut];
//    [sut dealloc]; // need to disable ARC
//    
//    // Assert
//    [myMock verify];
}

- (void)testKeyboardShowsWhenControllerWillAppear
{
    // Arrange
    id myMock = [OCMockObject mockForClass:[UITextField class]];
    sut.textField = myMock;
    
    // Act
    [[myMock expect] becomeFirstResponder];
    [sut viewWillAppear:YES];
    
    // Assert
    [myMock verify];
}

- (void)testConvertButtonSendsConvertMessageToModel
{
    
    // Arrange
    id myMock = [OCMockObject mockForClass:[ConverterModel class]];
    [[myMock expect] convertValue];
    sut.model = myMock;
    
    // Act
    [sut onConvertButton:self];
    
    // Assert
    [myMock verify];
}

- (void)testControllerSetsCorrectTextOnUpdate
{
    // Arrange
    sut.model = [ConverterModel new];
    NSString *sampleText = @"136.16";
    
    // Act
    [sut view];
    [sut.model updateWithText:sampleText];
    
    NSString *toVerify = sut.textField.text;
    
    // Assert
    XCTAssertEqualObjects(toVerify, sampleText);
}

- (void)testControllerDisablesConvertButtonOnModelDidUpdateNotificationIfTextIsEmpty
{
    // Arrange
    [sut view];
    sut.model = [ConverterModel new];
    sut.convertButton.enabled = YES;
    
    // Act
    [sut.model updateWithText:@""];//Disable button
    
    // Assert
    XCTAssertFalse(sut.convertButton.isEnabled);
}

- (void)testControllerEnablesConvertButtonOnModelDidUpdateNotificationIfModelHasText
{
    
    // Arrange
    sut.model = [ConverterModel new];
    
    // Act
    [sut view];
    [sut.model updateWithText:@"100"];
    
    // Assert
    XCTAssertTrue(sut.convertButton.isEnabled);
}

- (void)testPickerHasTheSameNumberOfItemsAsMathObjectsInModel
{
    // Arrange
    sut.model = [ConverterModel new];
    
    NSUInteger pickerCount = [sut pickerView:nil
                     numberOfRowsInComponent:0];
    
    NSUInteger modelCount = [[sut.model mathModelList] count];
    // Act
    
    // Assert
    XCTAssertEqual(pickerCount, modelCount);
}

- (void)testControllerReturnsCorrectTitleForPicker
{
    // Arrange
    sut.model = [ConverterModel new];
    
    // Act
    
    //Check default values
    NSString *currentTitle1 = [sut pickerView:nil
                                  titleForRow:0
                                 forComponent:0];
    
    NSString *correctTitle1 = [sut.model.mathModelList[0] description];
    
    //Change item
    [sut pickerView:nil didSelectRow:3 inComponent:0];
    
    NSString *currentTitle2 = [sut pickerView:nil
                                  titleForRow:3
                                 forComponent:0];
    
    NSString *correctTitle2 = [sut.model.mathModelList[3] description];
    
    
    // Assert
    XCTAssertEqualObjects(currentTitle1, correctTitle1);
    XCTAssertEqualObjects(currentTitle2, correctTitle2);
}

- (void)testControllersChangesMathInModelWhenPickerDidSelectARow
{
    
    // Arrange
    sut.model = [ConverterModel new];
    sut.model.selectedMathModel = 3;
    
    // Act
    [sut pickerView:nil didSelectRow:1 inComponent:0];
    NSUInteger selectedModel = sut.model.selectedMathModel;
    
    // Assert
    XCTAssertEqual(selectedModel, 1);
}

- (void)testControllerUpdatesModelWithCorrectTextWhenChangedCharacterInRange
{

}


@end
