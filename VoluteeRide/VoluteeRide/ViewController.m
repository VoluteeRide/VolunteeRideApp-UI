//
//  ViewController.m
//  VoluteeRide
//
//  Created by Karim Abdul on 10/25/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet UIButton *logInBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.signUpBtn.layer.cornerRadius = 5; // this value vary as per your desire
    self.signUpBtn.clipsToBounds = YES;
    
    self.logInBtn.layer.cornerRadius = 5; // this value vary as per your desire
    self.logInBtn.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
