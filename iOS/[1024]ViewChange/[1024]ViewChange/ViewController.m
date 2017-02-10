//
//  ViewController.m
//  [1024]ViewChange
//
//  Created by celeste on 2016. 10. 24..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButton:(id)sender {

}

- (IBAction)signUpButton:(id)sender {
    
    // 객체 만들기
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *vc2 =   [storyBoard instantiateViewControllerWithIdentifier:@"ViewController2"];
    [self.navigationController pushViewController:vc2 animated:YES];
}


@end
