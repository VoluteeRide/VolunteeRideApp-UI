//
//  RegistrationViewController.m
//  VoluteeRide
//
//  Created by Karim Abdul on 11/22/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "RegistrationViewController.h"
#import "VRRequestor.h"
#import "JKCenterLocation.h"
#import "MBProgressHUD.h"
#import "JKRegistrationTableViewCell.h"

//Personal Info Identifiers
static NSString *CellIdentifierUsername = @"Username";
static NSString *CellIdentifierPassword = @"Password";
static NSString *CellIdentifierFirstname = @"Firstname";
static NSString *CellIdentifierLastname = @"Lastname";
static NSString *CellIdentifierEmail = @"Email";
static NSString *CellIdentifierPhoneNumber = @"PhoneNumber";

//Vehicle Info Identifiers
static NSString *CellIdentifierMake = @"Make";
static NSString *CellIdentifierModel = @"Model";
static NSString *CellIdentifierCapacity = @"Capacity";
static NSString *CellIdentifierType = @"Type";
static NSString *CellIdentifierColor = @"Color";

//Jamat Khana Location Idenfifier
static NSString *CellIdentifierJKLocation = @"JKLocation";

//Registration Identifier
static NSString *CellIdentifierRegister = @"Register";

@interface RegistrationViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userSegmentControl;
@property (nonatomic, strong) NSArray *centerLocations;
@property (nonatomic, strong) UIPickerView *centerLocationsPickerView;
@property (nonatomic, assign) CGRect tableViewRect;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Registration";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    self.centerLocations = [NSArray array];
    
    UIColor *backgroundColor = [self.tableView backgroundColor];
    
    [self.view setBackgroundColor:backgroundColor];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-55.0f, 0.0f, 0.0f, 0.0f);
    self.tableViewRect = self.tableView.frame;
    
    [self requestJKLocations];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.userSegmentControl.selectedSegmentIndex == 0) {
        return 3;
    } else if (self.userSegmentControl.selectedSegmentIndex == 1 || self.userSegmentControl.selectedSegmentIndex == 2) {
        return 4;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.userSegmentControl.selectedSegmentIndex == 0) {
        switch (section) {
            case 0:
                return 6;
                break;
            case 1:
                return 1;
                break;
            case 2:
                return 1;
                break;
            default:
                return 0;
                break;
                
        }
    } else if (self.userSegmentControl.selectedSegmentIndex == 1 || self.userSegmentControl.selectedSegmentIndex == 2) {
        switch (section) {
            case 0:
                return 6;
                break;
            case 1:
                return 5;
                break;
            case 2:
                return 1;
                break;
            case 3:
                return 1;
                break;
            default:
                return 0;
                break;
                
        }

    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JKRegistrationTableViewCell *cell;
    cell.tag = indexPath.row;
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    
    if (self.userSegmentControl.selectedSegmentIndex == 0) {
        if (section == 0) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierUsername];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierUsername];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPassword];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPassword];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierFirstname];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierFirstname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierLastname];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierLastname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierEmail];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierEmail];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 5:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPhoneNumber];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPhoneNumber];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                default:
                    break;
            }
        }
        
        else if (section == 1) {
            
            switch (row) {
                case 0: {
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierJKLocation];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierJKLocation];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.centerLocationTextField.inputView = self.centerLocationsPickerView;
                    break;
                }
                    
                default:
                    break;
            }
        }
        else if (section == 2) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRegister];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierRegister];
                    }
                    break;
                    
                default:
                    break;
            }
        }

    }
    
    else if (self.userSegmentControl.selectedSegmentIndex == 1 || self.userSegmentControl.selectedSegmentIndex == 2) {
        
        
        if (section == 0) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierUsername];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierUsername];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPassword];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPassword];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierFirstname];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierFirstname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierLastname];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierLastname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierEmail];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierEmail];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 5:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPhoneNumber];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPhoneNumber];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                default:
                    break;
            }
        }
        
        else if (section == 1) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierMake];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierMake];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierModel];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierModel];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierCapacity];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierCapacity];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierType];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierType];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierColor];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierColor];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                default:
                    break;
            }
        }
    
        else if (section == 2) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierJKLocation];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierJKLocation];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.centerLocationTextField.inputView = self.centerLocationsPickerView;
                
                    break;
                    
                default:
                    break;
            }

        }
    
        else if (section == 3) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRegister];
                    
                    if(!cell) {
                        cell = [[JKRegistrationTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierRegister];
                    }
                    break;
                    
                default:
                    break;
            }
            
        }
    }
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *sectionName = @"";
    
    if (self.userSegmentControl.selectedSegmentIndex == 0) {
        switch (section)
        {
            case 0:
                sectionName = @"Personal Information";
                break;
            case 1:
                sectionName = @"Choose Jamat Khana Location";
                break;
            default:
                sectionName = @"";
                break;
        }

    } else if (self.userSegmentControl.selectedSegmentIndex == 1 || self.userSegmentControl.selectedSegmentIndex == 2) {
        switch (section)
        {
            case 0:
                sectionName = @"Personal Information";
                break;
            case 1:
                sectionName = @"Vehicle Information";
                break;
            case 2:
                sectionName = @"Choose Jamat Khana Location";
                break;
            default:
                sectionName = @"";
                break;
        }
    }
    
    return sectionName;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)userSegmentedControlndexChanged:(id)sender {
    [self.tableView reloadData];
}

- (void)requestJKLocations {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    
    __weak RegistrationViewController *weakSelf = self;
    VRRequestor *vrRequestor = [VRRequestor sharedInstance];
    [vrRequestor getJKLocations:^(AFHTTPRequestOperation *op, id resp) {
       
         [hud hide:YES];;
        
        if ([resp isKindOfClass:[NSArray class]]) {
            [weakSelf setJKCenterLocations:resp];
        }
        
    }];
}

- (void)setJKCenterLocations:(NSArray*)locations {
    
    NSMutableArray *jkLocations = [[NSMutableArray alloc] initWithCapacity:[locations count]];
    
    
    for (int i = 0; i<[locations count]; i++) {
        JKCenterLocation *centerLocation = [[JKCenterLocation alloc] initWithDictionary:[locations objectAtIndex:i]];
        [jkLocations addObject:centerLocation];
    }
    
    self.centerLocations = [jkLocations copy];
}

- (UIPickerView*)centerLocationsPickerView {
    
    if (!_centerLocationsPickerView) {
        _centerLocationsPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 216.0)];
        [_centerLocationsPickerView setDataSource: self];
        [_centerLocationsPickerView setDelegate: self];
        _centerLocationsPickerView.showsSelectionIndicator = YES;
    }
    
    return _centerLocationsPickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.centerLocations count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    JKCenterLocation *jkLocation = (JKCenterLocation*)[self.centerLocations objectAtIndex:row];
    return jkLocation.name;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 10);
    scrollPoint = [self.tableView convertPoint:scrollPoint fromView:textField.superview];
    [self.tableView setContentOffset:scrollPoint animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    
    if ([textField.placeholder isEqualToString:@"Phone Number"] && self.userSegmentControl.selectedSegmentIndex == 0) {
        [self jumpToNextTextField:textField withTag:100];
        return NO;
    }
    
    else if ([textField.placeholder isEqualToString:@"Color"] && self.userSegmentControl.selectedSegmentIndex == 1) {
        [self jumpToNextTextField:textField withTag:100];
        return NO;
    }

    
    NSInteger nextTag = textField.tag + 1;
    [self jumpToNextTextField:textField withTag:nextTag];
    return NO;
}

- (void)jumpToNextTextField:(UITextField *)textField withTag:(NSInteger)tag {
    
    // Gets the next responder from the view. Here we use self.view because we are searching for controls with
    // a specific tag, which are not subviews of a specific views, because each textfield belongs to the
    // content view of a static table cell.
    //
    // In other cases may be more convenient to use textField.superView, if all textField belong to the same view.
    UIResponder *nextResponder = [self.view viewWithTag:tag];
    
    if ([nextResponder isKindOfClass:[UITextField class]]) {
        // If there is a next responder and it is a textfield, then it becomes first responder.
        [nextResponder becomeFirstResponder];
    }
    else {
        // If there is not then removes the keyboard.
        [textField resignFirstResponder];
    }
}

- (void)dismissKeyboard {
    
    [self.view endEditing:YES];
    //[self.tableView setContentOffset:CGPointZero animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    NSLog(@"%li",(long)indexPath.row);
}

- (IBAction)registerUser:(id)sender {
    NSLog(@"%@",sender);
}

@end
