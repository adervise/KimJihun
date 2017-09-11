//
//  ViewController.m
//  [1108]StrongWeakExample
//
//  Created by celeste on 2016. 11. 8..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)reAdd:(id)sender {
    
    
    NSLog(@"weakLabel : %@, / strongLabel : %@ ", self.weakLabel, self.strongLabel);
    [self.view addSubview:self.weakLabel];
    [self.view addSubview:self.strongLabel];
}

- (IBAction)remove:(id)sender {
    [self.weakLabel removeFromSuperview];
    [self.strongLabel removeFromSuperview];
    
}
@end
