//
//  ViewController.m
//  [1121]CustomViewExample
//
//  Created by celeste on 2016. 11. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "nextViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *timer;
@property UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];

    self.timer = [[NSMutableArray alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"add"
                                                  style:UIBarButtonItemStylePlain
                                                  target:self
                                                  action:@selector(onSelectItem)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"refresh"
                                                    style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(onRefreshSelectItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 개수많큼 Row 생성
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.timer.count;
}


// Cell 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [self.timer objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

// Custom Add Section 생성
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionViewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    sectionViewHeader.backgroundColor = [UIColor redColor];

    UILabel *sectionHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 10, 250, 100)];
    [sectionHeaderLabel setText:@"Custom Button Test"];
    [sectionViewHeader addSubview:sectionHeaderLabel];
    
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBtn addTarget:self action:@selector(onSelectItem) forControlEvents:UIControlEventTouchUpInside];
    [itemBtn setFrame:CGRectMake(30, 30, 100, 44)];
    [itemBtn setTitle:@"add" forState:UIControlStateNormal];
    [itemBtn setTintColor:[UIColor greenColor]];
    [itemBtn setBackgroundColor:[UIColor purpleColor]];
    [sectionViewHeader addSubview:itemBtn];

    [tableView addSubview:sectionViewHeader];
    
    return sectionViewHeader;
}

// Add 버튼을 눌렀을 때 시간을 찍어주는 이벤트 생성
- (void)onSelectItem {
    
    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/mm/dd hh:mm:ss"];
    [self.timer addObject:[formatter stringFromDate:date]];
    [self.tableView reloadData];
}

- (void)onRefreshSelectItem {
    [self.timer removeAllObjects];
    [self.tableView reloadData];
}


// 인덱스 로우를 선택 했을 때 새로운 View를 만들어서 setText 처리
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *nextViewController = [[UIViewController alloc] init];
    UIView *mainView = [[UIView alloc] init] ;
    
    mainView.backgroundColor = [UIColor whiteColor];
    UILabel *nextViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 200, 100)];
    [nextViewLabel setText:[self.timer objectAtIndex:indexPath.row]];
    [mainView addSubview:nextViewLabel];
    
    nextViewController.view = mainView;

    [self.navigationController pushViewController:nextViewController animated:NO];
}

// 헤더 타이틀의 높이
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

@end
