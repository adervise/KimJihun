//
//  ViewController.m
//  [1025]NavigationBarExample
//
//  Created by celeste on 2016. 10. 25..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBtn addTarget:self action:@selector(onSelectBtnItem:) forControlEvents:UIControlEventTouchUpInside];
    // navigationBar 높이 44
    [itemBtn setFrame:CGRectMake(30, 30, 100, 44)];
    [itemBtn setTitle:@"custom" forState:UIControlStateNormal];
    [itemBtn setTintColor:[UIColor whiteColor]];
    [itemBtn setBackgroundColor:[UIColor redColor]];
    
    // BarButton item 에 집어넣기 Citem:custom 버튼
    UIBarButtonItem *cItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"hihi"
                                                    style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(onSelectItem:)];
   
    // 우선순위는 오른쪽이 위에 있다
    self.navigationItem.rightBarButtonItem = item;
    self.navigationItem.leftBarButtonItem = cItem;
}

- (void)onSelectBtnItem:(UIBarButtonItem *)sender {
    
    
}

- (void)onSelectItem:(UIBarButtonItem *)sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
