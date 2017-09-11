//
//  ViewController.m
//  [1011]TextFiledExample
//
//  Created by celeste on 2016. 10. 11..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UITextField *text;
@property UILabel *result;
@property UILabel *resultText;

@end

@implementation ViewController
@synthesize textInput, resultLabel;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.text.delegate = self;
    self.text = [[UITextField alloc] initWithFrame:CGRectMake(22, 150, 150, 30)];
    [self.text setBackgroundColor:[UIColor yellowColor]];
    [self.text setBorderStyle:UITextBorderStyleLine];
    [self.view addSubview:self.text];
    
    self.result = [[UILabel alloc] initWithFrame:CGRectMake(22, 200, 150, 30)];
    [self.result setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:self.result];
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.frame = CGRectMake(190, 150, 40, 40);
    [okBtn setTitle:@"확인" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(clickOkBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okBtn];
}


- (void)clickOkBtn:(UIButton *)sender {
        NSString *str = [[NSString alloc] initWithFormat:@"결과 %@", self.text.text];
        self.result.text = str;
        [self textFieldReturn];
}

-(BOOL)textFieldReturn {
    [self.text resignFirstResponder];
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpAction:(id)sender {
    resultLabel.text = [NSString stringWithFormat:@"%@", textInput.text];
}

@end
