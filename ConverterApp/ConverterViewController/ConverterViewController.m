//
//  ConverterViewController.m
//  ConverterApp
//
//  Created by maxim.k on 6/9/14.
//  All rights reserved.
//

#import "ConverterViewController.h"
#import "ConverterModel.h"

@implementation ConverterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSAssert(_notificationCenter, @"should not be nil when view did load");

    self.title = @"Converter";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [_notificationCenter addObserver:self selector:@selector(modelDidUpdate:) name:kConverterModelDidUpdateNotification object:_model];
}

- (void)dealloc
{
    [_notificationCenter removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_textField becomeFirstResponder];
}

#pragma mark - actions
- (IBAction)onConvertButton:(id)sender
{
    [_model convertValue];
}

#pragma mark - notifications
- (void)modelDidUpdate:(id)sender
{
    _textField.text = _model.text;
    _convertButton.enabled = [_model.text length] > 0;
}

#pragma mark - picker
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_model.mathModelList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[_model.mathModelList objectAtIndex:row] description];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _model.selectedMathModel = row;
}

#pragma mark - field
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [_model updateWithText:[textField.text stringByReplacingCharactersInRange:range withString:string]];
    
    return NO;
}

@end
