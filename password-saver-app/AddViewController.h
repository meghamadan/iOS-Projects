//
//  AddViewController.h
//  password-saver-app
//
//  Created by Megha Madan on 3/4/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SiteValue.h"

@interface AddViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) SiteValue *newrecord;

@property (strong, nonatomic) IBOutlet UITextField *website;

@property (strong, nonatomic) IBOutlet UITextField *username;

@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UITextField *count;

- (IBAction)enter:(UIButton *)sender;

@end
