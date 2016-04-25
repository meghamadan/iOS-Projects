//
//  AddViewController.m
//  password-saver-app
//
//  Created by Megha Madan on 3/4/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import "AddViewController.h"
#import "SiteValue.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_website setDelegate:self];
    [_username setDelegate:self];
    [_password setDelegate:self];
    [_count setDelegate:self];
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)enter:(UIButton *)sender {
    
    NSString *website = self.website.text;
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    NSString *countString = self.count.text;
    int count = [countString intValue];
    
    _newrecord = [SiteValue siteValueWithName: website andUsername: username andPassword: password andCount:count];
    
}



@end
