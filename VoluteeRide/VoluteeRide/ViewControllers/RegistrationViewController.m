//
//  RegistrationViewController.m
//  VoluteeRide
//
//  Created by Karim Abdul on 11/22/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "RegistrationViewController.h"

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

@interface RegistrationViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *userSegmentControl;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Registration";
    
    UIColor *backgroundColor = [self.tableView backgroundColor];
    
    [self.view setBackgroundColor:backgroundColor];
    
    self.tableView.contentInset = UIEdgeInsetsMake(-55.0f, 0.0f, 0.0f, 0.0f);

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
    
    UITableViewCell *cell;
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    
    if (self.userSegmentControl.selectedSegmentIndex == 0) {
        if (section == 0) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierUsername];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierUsername];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPassword];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPassword];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierFirstname];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierFirstname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierLastname];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierLastname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierEmail];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierEmail];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 5:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPhoneNumber];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPhoneNumber];
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
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierJKLocation];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierJKLocation];
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
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRegister];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierRegister];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
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
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierUsername];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPassword];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPassword];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierFirstname];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierFirstname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierLastname];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierLastname];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierEmail];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierEmail];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 5:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPhoneNumber];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPhoneNumber];
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
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierMake];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 1:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierModel];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierModel];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 2:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierCapacity];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierCapacity];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 3:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierType];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierType];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                case 4:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierColor];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierColor];
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
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierJKLocation];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                default:
                    break;
            }

        }
    
        else if (section == 3) {
            
            switch (row) {
                case 0:
                    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRegister];
                    
                    if(!cell)
                    {
                        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierRegister];
                    }
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    
                    break;
                    
                default:
                    break;
            }
            
        }
    }
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
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

@end
