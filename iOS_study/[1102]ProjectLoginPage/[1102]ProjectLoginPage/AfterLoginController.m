//
//  AfterLoginController.m
//  [1102]ProjectLoginPage
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "AfterLoginController.h"

@interface AfterLoginController ()

@end

@implementation AfterLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *idData = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    self.userResultLabel.text = idData;
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
