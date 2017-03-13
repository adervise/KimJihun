//
//  ViewController.m
//  [1013]LoginExample
//
//  Created by celeste on 2016. 10. 13..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate, UITextFieldDelegate, UITableViewDelegate>

@property UITextField *pwTxtField;
@property UITextField *idTxtField;
@property UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*! 로그인 페이지 제목 라벨 객체 생성 및 값 부여  */
    UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-75, 50, 150, 50)];
    [titleLb setText:@"MY Login Page"];
    [titleLb setBackgroundColor:[UIColor redColor]];
    [titleLb setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:titleLb];
    
    /*! 스크롤 뷰 객체 생성 및 값 부여  */
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.center.x-190, self.view.center.y-150, 380, 250)];
    self.scrollView = scrollView;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];

    /*! 아이디 라벨 객체 생성 및 값 부여  */
    UILabel *idLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 50, 30)];
    [idLb setText:@"ID : "];
    [idLb setBackgroundColor:[UIColor redColor]];
    [idLb setTextAlignment:NSTextAlignmentCenter];
    [scrollView addSubview:idLb];
    
    /*! 비밀번호 라벨 객체 생성 및 값 부여  */
    UILabel *pwLb = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 50, 30)];
    [pwLb setText:@"PW : "];
    [pwLb setBackgroundColor:[UIColor redColor]];
    [pwLb setTextAlignment:NSTextAlignmentCenter];
    [scrollView addSubview:pwLb];
    
    /*! 아이디 텍스트필드 객체 생성 및 값 부여  */
    UITextField *idTxtField = [[UITextField alloc] initWithFrame:CGRectMake(100, 30, 150, 30)];
    [idTxtField setBackgroundColor:[UIColor greenColor]];
    self.idTxtField = idTxtField;
    idTxtField.delegate = self;
    [scrollView addSubview:idTxtField];
    
    /*! 비밀번호 텍스트필드 객체 생성 및 값 부여  */
    UITextField *pwTxtField = [[UITextField alloc] initWithFrame:CGRectMake(100, 80, 150, 30)];
    [pwTxtField setBackgroundColor:[UIColor greenColor]];
    self.pwTxtField = pwTxtField;
    pwTxtField.delegate = self;
    [scrollView addSubview:pwTxtField];
    
    /*! 로그인버튼 객체 생성 및 값 부여  */
    UIButton *btnLogin = [[UIButton alloc]initWithFrame:CGRectMake(40, 150, 90, 30)];
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    [btnLogin setBackgroundColor:[UIColor grayColor]];
    [scrollView addSubview:btnLogin];
    
    /*! 회원가입 버튼 객체 생성 및 값 부여  */
    UIButton *btnSignUp = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 90, 30)];
    [btnSignUp setTitle:@"Sign Up" forState:UIControlStateNormal];
    [btnSignUp setBackgroundColor:[UIColor grayColor]];
    [scrollView addSubview:btnSignUp];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointMake(0, 30)];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointMake(0, -30)];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.idTxtField) {
        NSLog(@"%@", textField);
        [textField resignFirstResponder];
        [self.pwTxtField becomeFirstResponder];
    } else if (textField == self.pwTxtField) {
        NSLog(@"%@", textField);
        [textField resignFirstResponder];
    } else {
        NSLog(@"%@", textField);
        [textField resignFirstResponder];
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
