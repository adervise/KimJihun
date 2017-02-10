//
//  ViewController2.m
//  [1024]ViewChange
//
//  Created by celeste on 2016. 10. 24..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController2.h"
#import "ViewControllerWithXIB.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchupInsideDismissBtn:(id)sender {
    //present
//    [self dismissViewControllerAnimated:YES completion:nil];
     [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signUp:(id)sender {
    
    ViewControllerWithXIB *vcWithX = [[ViewControllerWithXIB alloc] initWithNibName:@"ViewControllerWithXIB" bundle:nil];
//        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vcWithX];
    [self.navigationController pushViewController:vcWithX animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
     NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
     NSLog(@"viewDidDisappear");
}

- (void)viewDidLayoutSubviews {
    NSLog(@"viewDidLayoutSubviews");
}

@end
