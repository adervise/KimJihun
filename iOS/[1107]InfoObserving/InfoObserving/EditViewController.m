//
//  EditViewController.m
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "EditViewController.h"
#import "UserInformation.h"

@interface EditViewController ()

@property IBOutlet UILabel *idLabel;
@property IBOutlet UILabel *pwLabel;
@property IBOutlet UITextField *lastNameField;
@property IBOutlet UITextField *firstNameField;
@property IBOutlet UITextField *ageField;
@property IBOutlet UITextField *hobbyField;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UserInformation *info = [UserInformation sharedUserInfo];
    self.idLabel.text = info.userId;
    self.pwLabel.text = info.userPassword;
    self.lastNameField.text = info.lastName;
    self.firstNameField.text = info.firstName;
    self.ageField.text = info.age;
    self.hobbyField.text = info.hobby;
    
}

- (IBAction)clickSaveButton:(id)sender {
    
    UserInformation *info = [UserInformation sharedUserInfo];
    
    info.lastName = self.lastNameField.text;
    info.firstName = self.firstNameField.text;
    info.age = self.ageField.text;
    info.hobby = self.hobbyField.text;
    
    [self.navigationController popViewControllerAnimated:YES];
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
