//
//  ViewController.m
//  [1110]BlockExample
//
//  Created by celeste on 2016. 11. 10..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

// 정의되어 있는 형식을 쓸 때 block 을 쓴다.
typedef void(^testBlock)(BOOL isLock);
typedef void(^successBlock)(BOOL);
typedef void(^hello)(NSString *name);

@interface ViewController ()

@property void(^plusNumber)(NSInteger num1 , NSInteger num2);
@property NSInteger(^returnInteger)(NSInteger num1);
@property NSInteger numnum;
@property (nonatomic) testBlock t1;
@property (nonatomic) successBlock networkSuccess;
@property (nonatomic) successBlock downloadSuccess;
@property (strong, nonatomic) IBOutlet UILabel *testLabel;

- (IBAction)actionButton0:(id)sender;
- (IBAction)actionButton1:(id)sender;
- (IBAction)actionButton2:(id)sender;
- (IBAction)actionButton3:(id)sender;
- (IBAction)actionButton4:(id)sender;
- (IBAction)actionButton5:(id)sender;
- (IBAction)actionButton6:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    // 1. 블럭함수 만들기 실습1
    void (^doubleInteger)(NSInteger) = ^(NSInteger num){
        num *= num;
        NSLog(@"%ld", num);
    };
    doubleInteger(3);
    
    // 2. 블럭함수 만들기 실습2
    void (^isBLock)(void) = ^(void){
        NSLog(@"This is Block");
    };
    isBLock();
    
    // 3. 블럭함수 만들기 실습3 프로퍼티를 블록으로 선언해서 실행
    _plusNumber = ^(NSInteger num1, NSInteger num2){
        NSLog(@"%ld", num1 + num2);
    };
    // property 로 선언된 함수 호출
    _plusNumber(8,5);
    
    // 4. 블럭함수 만들기 실습4 프로퍼티를 블록으로 선언해서 실행
    _returnInteger = ^(NSInteger num1){
        NSLog(@"%ld",num1);
        return num1;
    };
    _returnInteger(100);
    
     
    NSString *(^returnString)(NSString *) = ^(NSString *test){
        NSLog(@"%@",test);
        return test;
    };
    returnString(@"gogogo");
    
    
    NSInteger (^returnInteger2)(NSInteger) = ^(NSInteger num){
        num *= num;
        NSLog(@"%ld", num);
        return num;
    };
    returnInteger2(15);
    
    
    _t1 = ^(BOOL isLock) {
        NSLog(@"isLock");
    };
    _t1(YES);
    
    
    // 블럭은 객체 이기 때문에 원래 num3 라는 것을 알 수 없다. 하지만... 알 수 있게 구현해 두었다... 애플이... 멍미!?!!? closure
    NSInteger num3 = 4;
    _t1 = ^(BOOL isLock) {
        NSLog(@"%ld",num3);
    };
    _t1(YES);

    // test Method 에 1번을 Test 하기 위한 부분
    self.numnum = 0;
    [self testMethod];
    
    
    // typedef를 선언해서 호출 하는 방법
    hello test = ^(NSString *name){
        NSLog(@"!!! typedef call !!! %@",name);
    };
    [self testBlockMethodInParam:test];
    
    // 메소드 자체에 블럭을 만들어서 testBlockMethodInParam 메소드에 블럭파라미터를 전달하는 방법 위와 같은 코드
    [self testBlockMethodInParam:^(NSString *name){
        NSLog(@"!!!! %@",name);
    }];
    
    
    // UILabel asnimation Test
    [UIView beginAnimations:@"animation" context:nil];
    
    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:3];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [self.testLabel setFrame:CGRectMake(150, 150, 100, 100)];
    [UIView commitAnimations];
    
    
    ViewController __weak *wself = self;
    
    void(^ani)(void) = ^{
        [wself.testLabel setFrame:CGRectMake(100, 100, 300, 300)];
    };
    
    [UIView animateWithDuration:3.2 animations:ani];
    
    // 위에 메소드와 지금 메소드는 같은 의미이다.
    [UIView animateWithDuration:3.2 animations:^{
        [wself.testLabel setFrame:CGRectMake(100, 100, 700, 700)];

    }];
    
    [UIView animateWithDuration:3.5 animations:^{
        NSLog(@"test");
    } completion:^(BOOL finished) {
        if (finished) {
            // 어떤 일을 해라
        }
    }];

}

- (void)testBlockMethodInParam:(void(^)(NSString *name))param {
    NSLog(@"before Start Block");
    param(@"in param");
    NSLog(@"??? %@",param);
    NSLog(@"after EndBlodk");
}

- (IBAction)actionButton0:(id)sender {
    
    ViewController __weak *wself = self;
    
    void(^ani)(void) = ^{
        [wself.testLabel setFrame:CGRectMake(100, 100, 300, 300)];
    };
    
    [UIView
     animateWithDuration:3
     delay:10
     options:UIViewAnimationOptionRepeat
     animations:ani
     completion:^(BOOL finished) {
                if (finished) {
                    NSLog(@" UIViewAnimationOptionRepeat %i",finished);
                }
    }];
}


- (void)testMethod {
    
    
    // block 에서 사용할 변수를 선언함.
    __block NSInteger anInteger = 42;
    
    // 3.번을 참고하기 위한 변수 선언
    NSInteger nonInteger = 101;
    
    // 이렇게 self.property 를 제대로 쓰려면 아래와 같이 헤야 안전하다. 이렇게 오류의 영역이 메모리로 가버리면 오류를 찾기가 어려워진다.
    ViewController * __weak wself = self;
    
    
    void (^testBlock)(void) = ^{
        
        // 1. block 안에서 self 안의 property 값을 가지고 있네? why? -> block 의 refernce count 가 떨어지지 않는다! 그렇다면 어떻게 해야할까?
        self.numnum = 10;
        NSLog(@"self.numnum : %ld",self.numnum);
    
        // 1.1 이렇게 해야 refernce count에 영향을 미치지 않는다.
        wself.numnum = 10;
        NSLog(@"self.numnum : %ld",wself.numnum);
        
        // 블럭 안에서 블럭관련 변수를 선언 할 수 있다.
        __block NSInteger anInteger = 65;
        NSLog(@"__block NSInteger anInteger : %ld",anInteger);
        
        // 3. 이렇게 외부에서 선언하고 내부에서 변수 값을 바꾸는 경우! 이런 경우 아래코드는 오류가 난다! 아래는 캡쳐이고, 위에 변수 선언과는 관련이 없다 여기기 때문에!
        // nonInteger = 52;
        NSLog(@"in block nonInteger : %ld",nonInteger);
    };
    
    // 블럭 밖에서의 변수 변경
    anInteger = 84;
    testBlock();
    NSLog(@"out block %ld",anInteger);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
