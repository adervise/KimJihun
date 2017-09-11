//
//  ViewController.m
//  [1027]AlerControllerExample
//
//  Created by celeste on 2016. 10. 27..
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

// UIAlertControllerStyleAlert Click
- (IBAction)clickAlertController:(id)sender {
    [self showAlertController:UIAlertControllerStyleAlert];
}

// UIAlertControllerStyleActionSheet Click
- (IBAction)clickActionSheet:(id)sender {
    [self showAlertController:UIAlertControllerStyleActionSheet];
}

// 클릭에 따른 파라미터를 style param을 받아서 스타일 처리
- (void)showAlertController:(UIAlertControllerStyle)style {
    
    /* 
        굳이 switch 구문을 쓴 이유는?
        UIAlertControllerStyle 값은 enum으로 되어있다.
        위 메소드에서 100을 입력하면 스위치의 default로 넘어가게 된다.
        아래 스위치 case 는 if의 or( || ) 와 같은 역할이라고 볼 수 있다.
     */
    
    switch (style) {
        case UIAlertControllerStyleAlert:
        case UIAlertControllerStyleActionSheet:
            NSLog(@"%ld, 스타일이 입력 되었습니다.", style);
            break;
        default:
            NSLog(@"스타일이 잘못 입력되었습니다.");
            return;
            break;
    }
    
    /*
        iOS handler:handlerBlock 메소드를 이렇게 따로 뺄 수 있다.
        action을 실행 했을 때의 코드의 묶음.
        블럭 안의 코드를 호출해 달라라는 의미.
     */
    void (^handlerBlock)(UIAlertAction *) = ^(UIAlertAction * _Nonnull action) {
        NSLog(@"핸들러가 호출되었습니다. %@", action);
        
        // 지훈 방법
        if ([[action title] isEqualToString:@"Cancel"]) {
            NSLog(@"cancel이 클릭되었습니다,");
        } else {
            NSLog(@"else 로그 입니다.");
        }
        
        // 야곰쌤 방법
        switch ([action style]) {
            case UIAlertActionStyleCancel:
                NSLog(@"cancel");
                break;
            case UIAlertActionStyleDefault:
                NSLog(@"UIAlertActionStyleDestructive");
                
                if ([[action title] isEqualToString:@"확인"]) {
                    NSLog(@"사용자가 확인했습니다");
                }
                break;
            case UIAlertActionStyleDestructive:
                NSLog(@"UIAlertActionStyleDestructive");
            default:
                break;
        }
    };
    
    // AlertController Add
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"alert"
                                          message:@"alert use"
                                          preferredStyle:style];

    // Cancel AlertAction Add
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:handlerBlock];
    
    [alertController addAction:cancelAction];

    // Default AlertAction Add
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Default"
                               style:UIAlertActionStyleDefault
                               handler:handlerBlock];
    
    // Destructive AlertAction Add
    [alertController addAction:okAction];
    
    UIAlertAction *destructiveAction = [UIAlertAction
                                        actionWithTitle:@"Destructive"
                                        style:UIAlertActionStyleDestructive
                                        handler:^(UIAlertAction * _Nonnull action) {
                                                    NSLog(@"Destructive Click");
                                        }];
    
    [alertController addAction:destructiveAction];
    
    // present modally 시키기
    [self presentViewController:alertController animated:YES completion:^{NSLog(@"completiomBlockCode Test");}];
}



@end
