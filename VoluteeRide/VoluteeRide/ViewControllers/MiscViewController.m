//
//  LoginViewController.m
//  VoluteeRide
//
//  Created by Karim Abdul on 11/15/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "MiscViewController.h"
#import "SignUpViewController.h"
#import "XLForm.h"

@interface MiscViewController ()

@end

@implementation MiscViewController

NSString *const kCustomSelectors = @"customSelectors";
NSString * const kValidationEmail = @"kEmail";
NSString * const kValidationPassword = @"kPassword";

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeForm];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeForm
{
    XLFormDescriptor * formDescriptor = [XLFormDescriptor formDescriptorWithTitle:@"Text Fields"];
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    // Email Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Login User"];
    [formDescriptor addFormSection:section];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kValidationEmail rowType:XLFormRowDescriptorTypeText title:@"Email"];
    [row.cellConfigAtConfigure setObject:@"Email..." forKey:@"textField.placeholder"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = YES;
    row.value = @"";
    [row addValidator:[XLFormValidator emailValidator]];
    [section addFormRow:row];

    
    // Password
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kValidationPassword rowType:XLFormRowDescriptorTypePassword title:@"Password"];
    [row.cellConfigAtConfigure setObject:@"Password..." forKey:@"textField.placeholder"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:@"At least 6, max 32 characters" regex:@"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$"]];
    [section addFormRow:row];
    
    
    // Registration Section
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [formDescriptor addFormSection:section];

    // --------- Custom Selectors
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Not Registered?"];
    [formDescriptor addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kCustomSelectors rowType:XLFormRowDescriptorTypeButton title:@"Registeration"];
    row.action.viewControllerClass = [SignUpViewController class];
    [section addFormRow:row];

    
    
    self.form = formDescriptor;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
