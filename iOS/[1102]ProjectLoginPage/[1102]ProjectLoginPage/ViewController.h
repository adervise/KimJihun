//
//  ViewController.h
//  [1102]ProjectLoginPage
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *idTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)login:(id)sender;
- (IBAction)signUp:(id)sender;

@end

