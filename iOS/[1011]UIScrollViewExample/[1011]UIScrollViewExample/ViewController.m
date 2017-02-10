//
//  ViewController.m
//  [1011]UIScrollViewExample
//
//  Created by celeste on 2016. 10. 11..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property UILabel *pageNum;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    // 컨텐츠 사이즈 조정
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width*3, 460)];
    // 델이게이트 설정
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    // 페이지 Num 확인
    UILabel *pageNum = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 55, 55)];
    [pageNum setBackgroundColor:[UIColor whiteColor]];
    pageNum.text = @"1page";
    // 선언한 property 와 생성한 객체를 연결.
    self.pageNum = pageNum;
    [self.view addSubview:pageNum];
    
    // 추가뷰
    UIView *newView1 =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [newView1 setBackgroundColor:[UIColor blueColor]];
    [scrollView addSubview:newView1];
    
    UIView *newView2 =  [[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 460)];
    [newView2 setBackgroundColor:[UIColor greenColor]];
    [scrollView addSubview:newView2];
    
    UIView *newView3 =  [[UIView alloc] initWithFrame:CGRectMake(640, 0, 320, 460)];
    [newView3 setBackgroundColor:[UIColor redColor]];
    [scrollView addSubview:newView3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger pageNum = scrollView.contentOffset.x/320+1;
    self.pageNum.text = [[NSString alloc] initWithFormat:@"%ld page",pageNum];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
