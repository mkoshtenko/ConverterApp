//
//  ConverterViewController.h
//  ConverterApp
//
//  Created by maxim.k on 6/9/14.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@class ConverterModel;

@interface ConverterViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) ConverterModel* model;

@property(nonatomic, weak) IBOutlet UITextField* textField;
@property(nonatomic, weak) IBOutlet UIPickerView* pickerView;
@property(nonatomic, weak) IBOutlet UIButton* convertButton;

@property (nonatomic, weak) NSNotificationCenter* notificationCenter;

- (IBAction)onConvertButton:(id)sender;

@end
