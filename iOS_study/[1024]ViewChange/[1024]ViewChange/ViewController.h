//
//  ViewController.h
//  [1024]ViewChange
//
//  Created by celeste on 2016. 10. 24..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *idTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)loginButton:(id)sender;

- (IBAction)signUpButton:(id)sender;


@end

