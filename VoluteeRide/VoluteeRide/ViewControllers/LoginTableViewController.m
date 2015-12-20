//
//  LoginTableViewController.m
//  VoluteeRide
//
//  Created by Karim Abdul on 11/15/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "LoginTableViewController.h"

static NSString *CellIdentifierEmail = @"Email";
static NSString *CellIdentifierPassword = @"Password";
static NSString *CellIdentifierSubmit = @"Submit";
static NSString *CellIdentifierRegistration = @"Registration";

@interface LoginTableViewController ()

@end

@implementation LoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 2;
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
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell;
    
    NSInteger section = [indexPath section];
    
    
    switch (section) {
        case 0:
            if (indexPath.row == 0) {
                
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierEmail];
                
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierEmail];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            if (indexPath.row == 1) {
                
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPassword];
                
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierPassword];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            break;
            
        case 1:
            if (indexPath.row == 0) {
                
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierSubmit];
                
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierSubmit];
                }
            }
            
            break;
        
        case 2:
            if (indexPath.row == 0) {
                
                cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierRegistration];
                
                if(!cell)
                {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierRegistration];
                }
            }
            
            break;
            
        default:
            break;
    }
    
    // Configure the cell...
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Login";
            break;
        case 1:
            //sectionName = @"Not Registered?";
            break;
        case 2:
            sectionName = @"Not Registered?";
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
    NSLog(@"%li",(long)indexPath.row);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
