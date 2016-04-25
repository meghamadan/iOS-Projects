//
//  ViewController.h
//  password-saver-app
//
//  Created by Megha Madan on 3/3/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SiteValue.h"
#import "AddViewController.h"

@interface ViewController : UIViewController


@property NSMutableArray *login;

@property int current;

@property int loginSize;

@property (strong, nonatomic) IBOutlet UITextField *website;

@property (strong, nonatomic) IBOutlet UITextField *username;

@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UITextField *count;

@property (strong, nonatomic) IBOutlet UIButton *forwardO;

@property (strong, nonatomic) IBOutlet UIButton *backwardO;

@property (strong, nonatomic) IBOutlet UISlider *slider;

- (IBAction)sliderChange:(UISlider *)sender;


- (IBAction)forward:(UIButton *)sender;

- (IBAction)backward:(UIButton *)sender;

- (IBAction)incrementcount:(UIButton *)sender;

- (IBAction)addrecord:(UIButton *)sender;

@end

