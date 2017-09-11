//
//  ViewController.m
//  [0930]SlotMachineExample
//
//  Created by celeste on 2016. 9. 30..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 메뉴1
    UIView *menu1 = [[UIView alloc]initWithFrame:CGRectMake(35, 35, self.view.frame.size.width/2-45, self.view.frame.size.height/3-35)];
    menu1.backgroundColor = [UIColor brownColor];
    [self.view addSubview:menu1];
    
    // 메뉴1 가격
    UILabel *menuPrice1 = [[UILabel alloc]initWithFrame:CGRectMake(menu1.center.x-116, menu1.frame.size.height-60, menu1.frame.size.width, 60)];
    [menuPrice1 setBackgroundColor:[UIColor yellowColor]];
    [menuPrice1 setText:@"100,000,000"];
    [menuPrice1 setTextAlignment:NSTextAlignmentCenter];
    [menuPrice1 setFont:[UIFont systemFontOfSize:16]];
    [menu1 addSubview:menuPrice1];
    
    UIImageView *imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2-45, self.view.frame.size.height/3-95)];
    [imgView1 setImage:[UIImage imageNamed:@"mac.jpg"]];
    [imgView1 setContentMode:UIViewContentModeScaleToFill];
    [menu1 addSubview:imgView1];
    
    // 메뉴2
    UIView *menu2 = [[UIView alloc]initWithFrame:CGRectMake(menu1.frame.size.width+55, 35, self.view.frame.size.width/2-45, self.view.frame.size.height/3-35)];
    menu2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:menu2];
    
    // 메뉴2 가격
    UILabel *menuPrice2 = [[UILabel alloc]initWithFrame:CGRectMake(menu1.center.x-116, menu2.frame.size.height-60, menu2.frame.size.width, 60)];
    [menuPrice2 setBackgroundColor:[UIColor yellowColor]];
    [menuPrice2 setText:@"200,000,000"];
    [menuPrice2 setTextAlignment:NSTextAlignmentCenter];
    [menuPrice2 setFont:[UIFont systemFontOfSize:16]];
    [menu2 addSubview:menuPrice2];
    
    UIImageView *imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2-45, self.view.frame.size.height/3-95)];
    [imgView2 setImage:[UIImage imageNamed:@"ferrari.jpg"]];
    [imgView2 setContentMode:UIViewContentModeScaleToFill];
    [menu2 addSubview:imgView2];
    
    // 메뉴3
    UIView *menu3 = [[UIView alloc]initWithFrame:CGRectMake(35, self.view.frame.size.height/3+20, self.view.frame.size.width/2-45, self.view.frame.size.height/3-35)];
    menu3.backgroundColor = [UIColor brownColor];
    [self.view addSubview:menu3];
    
    // 메뉴3 가격
    UILabel *menuPrice3 = [[UILabel alloc]initWithFrame:CGRectMake(0, menu3.frame.size.height-60, menu3.frame.size.width, 60)];
    [menuPrice3 setBackgroundColor:[UIColor yellowColor]];
    [menuPrice3 setText:@"300,000,000"];
    [menuPrice3 setTextAlignment:NSTextAlignmentCenter];
    [menuPrice3 setFont:[UIFont systemFontOfSize:16]];
    [menu3 addSubview:menuPrice3];
    
    UIImageView *imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2-45, self.view.frame.size.height/3-95)];
    [imgView3 setImage:[UIImage imageNamed:@"centenario.jpg"]];
    [imgView3 setContentMode:UIViewContentModeScaleToFill];
    [menu3 addSubview:imgView3];
    
    // 메뉴4
    UIView *menu4 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+10, self.view.frame.size.height/3+20, self.view.frame.size.width/2-45, self.view.frame.size.height/3-35)];
    menu4.backgroundColor = [UIColor brownColor];
    [self.view addSubview:menu4];
    
    // 메뉴4 가격
    UILabel *menuPrice4 = [[UILabel alloc]initWithFrame:CGRectMake(0, menu4.frame.size.height-60, menu4.frame.size.width, 60)];
    [menuPrice4 setBackgroundColor:[UIColor yellowColor]];
    [menuPrice4 setText:@"400,000,000"];
    [menuPrice4 setTextAlignment:NSTextAlignmentCenter];
    [menuPrice4 setFont:[UIFont systemFontOfSize:16]];
    [menu4 addSubview:menuPrice4];
    
    UIImageView *imgView4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2-45, self.view.frame.size.height/3-95)];
    [imgView4 setImage:[UIImage imageNamed:@"batcar.jpg"]];
    [imgView4 setContentMode:UIViewContentModeScaleToFill];
    [menu4 addSubview:imgView4];
    
    //가격표시 테두리
    UIView *moneyTotal = [[UIView alloc]initWithFrame:CGRectMake(35, self.view.frame.size.height/1.5+20, self.view.frame.size.width-65, 85)];
    moneyTotal.backgroundColor = [UIColor greenColor];
    [self.view addSubview:moneyTotal];
    
    //가격표시 레이블
    UILabel *moneyDisplay = [[UILabel alloc]initWithFrame:CGRectMake(moneyTotal.center.x, 0, 130, moneyTotal.frame.size.height)];
    
    [moneyDisplay setBackgroundColor:[UIColor redColor]];
    [moneyDisplay setText:@"잔액 : 0원"];
    [moneyDisplay setTextAlignment:NSTextAlignmentCenter];
    [moneyDisplay setFont:[UIFont systemFontOfSize:14]];
    [moneyTotal addSubview:moneyDisplay];

    UIView *inputMoney = [[UIView alloc]initWithFrame:CGRectMake(35, self.view.frame.size.height/1.5+125, self.view.frame.size.width-65, 70)];
    inputMoney.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:inputMoney];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
