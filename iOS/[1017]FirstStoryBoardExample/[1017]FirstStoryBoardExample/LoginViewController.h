//
//  LoginViewController.h
//  [1017]FirstStoryBoardExample
//
//  Created by celeste on 2016. 10. 17..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *idText;

@property (strong, nonatomic) IBOutlet UITextField *passwdText;

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;


- (IBAction)loginResult:(id)sender;

- (IBAction)clickAutoLogin:(id)sender;

@end

