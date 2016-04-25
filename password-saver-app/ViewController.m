//
//  ViewController.m
//  password-saver-app
//
//  Created by Megha Madan on 3/3/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "SiteValue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_website setEnabled: NO];
    [_username setEnabled: NO];
    [_password setEnabled: NO];
    [_count setEnabled: NO];
    
    
    _login = [[NSMutableArray alloc] init];
    
    SiteValue *gmail = [SiteValue siteValueWithName: @"Gmail" andUsername: @"meghamadan" andPassword:@"mm" andCount:3];
    SiteValue *facebook = [SiteValue siteValueWithName: @"Facebook" andUsername: @"yellow" andPassword:@"brick" andCount:4];
    SiteValue *tumblr = [SiteValue siteValueWithName: @"Tumblr" andUsername: @"coconut" andPassword:@"potato" andCount:11];
    SiteValue *soundcloud = [SiteValue siteValueWithName: @"Soundcloud" andUsername: @"coffee" andPassword:@"mug" andCount:8];
    SiteValue *linkedin = [SiteValue siteValueWithName: @"Linkedin" andUsername: @"business" andPassword:@"casual" andCount:26];
    
    
    [_login addObject:gmail];
    [_login addObject:facebook];
    [_login addObject:tumblr];
    [_login addObject:soundcloud];
    [_login addObject:linkedin];

    
    [self displayLogin];
    
    _loginSize = 5;
    
    if(_loginSize == 1){
        [_backwardO setEnabled:NO];
        [_forwardO setEnabled:NO];
    }
    else{
        [_backwardO setEnabled:NO];
    }
    _current = 0;
    
    _slider.maximumValue = _loginSize - .01;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//displays respective elements of the current object
-(void)displayLogin{
    SiteValue *currentObject = [_login objectAtIndex: _current];
    self.website.text = [currentObject getWebsite];
    self.username.text = [currentObject getUsername];
    self.password.text = [currentObject getPassword];
    int x = [currentObject getCount];
    self.count.text = [NSString stringWithFormat:@"%d",x];
}


- (IBAction)sliderChange:(UISlider *)sender {
    
    _current = self.slider.value;
    [self displayLogin];
    
    if(_current < _loginSize-1)
        [_forwardO setEnabled:YES];
    else
        [_forwardO setEnabled:NO];
    
    if(_current > 0)
        [_backwardO setEnabled:YES];
    else
        [_backwardO setEnabled:NO];
    
    
}

- (IBAction)forward:(UIButton *)sender {
    if(_current < _loginSize-1){
        [_backwardO setEnabled:YES];
        _current++;
        [self displayLogin];
        if(_current +1 == _loginSize)
            [sender setEnabled:NO];
    }
    else{
        [sender setEnabled:NO];
    }
}

- (IBAction)backward:(UIButton *)sender {
    if(_current > 0){
        [_forwardO setEnabled:YES];
        _current--;
        [self displayLogin];
        if(_current -1 == -1)
            [sender setEnabled:NO];
        
    }
    else{
        [sender setEnabled:NO];
    }
}

- (IBAction)incrementcount:(UIButton *)sender {
    SiteValue *currentObject = [_login objectAtIndex: _current];
    [currentObject incrementCount];
    [self displayLogin];
}

- (IBAction)addrecord:(UIButton *)sender {

    [self performSegueWithIdentifier:@"addSegue" sender:sender];
}


// no error checking!!
- (IBAction)unwindAndAdd:(UIStoryboardSegue*)sender
{
    AddViewController *source = sender.sourceViewController;
    
    [_login addObject: source.newrecord];
    
    _loginSize++;
    _slider.maximumValue = _loginSize - .01;
    
    [_forwardO setEnabled:YES];
}


@end
