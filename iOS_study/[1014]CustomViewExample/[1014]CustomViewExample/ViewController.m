//
//  ViewController.m
//  [1014]CustomViewExample
//
//  Created by celeste on 2016. 10. 14..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "IdolCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>


@property UITableView *tvView;
@property NSArray *dataList;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tvView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tvView.delegate = self;
    self.tvView.dataSource = self;
    self.dataList = @[@{@"title":@"space1",@"imageUrl":@"1.jpg"},
                      @{@"title":@"space2",@"imageUrl":@"2.jpg"},
                      @{@"title":@"space3",@"imageUrl":@"3.jpg"},
                      @{@"title":@"space4",@"imageUrl":@"1.jpg"},
                      @{@"title":@"space5",@"imageUrl":@"2.jpg"},
                      @{@"title":@"space6",@"imageUrl":@"3.jpg"},
                      @{@"title":@"space7",@"imageUrl":@"1.jpg"},
                      @{@"title":@"space8",@"imageUrl":@"2.jpg"},
                      @{@"title":@"space9",@"imageUrl":@"3.jpg"}];
    [self.view addSubview:self.tvView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IdolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil) {
        cell = [[IdolCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    NSDictionary *data = self.dataList[indexPath.row];
    [cell setBackgroundImageName:[data objectForKey:@"imageUrl"]];
    [cell setTitle:[data objectForKey:@"title"]];

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
