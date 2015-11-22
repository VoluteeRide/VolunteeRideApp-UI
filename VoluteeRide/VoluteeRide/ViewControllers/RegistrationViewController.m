//
//  RegistrationViewController.m
//  VoluteeRide
//
//  Created by Karim Abdul on 11/22/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Registration";
    
    UIColor *backgroundColor = [self.tableView backgroundColor];
    
    [self.view setBackgroundColor:backgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
