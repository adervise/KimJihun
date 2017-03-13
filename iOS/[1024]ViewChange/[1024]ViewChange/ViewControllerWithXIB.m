//
//  ViewControllerWithXIB.m
//  [1024]ViewChange
//
//  Created by celeste on 2016. 10. 24..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewControllerWithXIB.h"
#import "ViewController2.h"

@interface ViewControllerWithXIB ()

@end

@implementation ViewControllerWithXIB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTouchupInsideNextBtn:(id)sender {
    // 객체 만들기
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController2 *vc2 =   [storyBoard instantiateViewControllerWithIdentifier:@"ViewController2"];
    // view2 이동
    /* present
    [vc2 setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:vc2 animated:YES completion:nil];
    */
    
    [self.navigationController pushViewController:vc2 animated:YES];
}

- (IBAction)moveBack:(id)sender {
}


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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
