//
//  SignUpController.h
//  [1102]ProjectLoginPage
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *idTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *rePasswordTextField;

- (IBAction)signUp:(id)sender;

@end
