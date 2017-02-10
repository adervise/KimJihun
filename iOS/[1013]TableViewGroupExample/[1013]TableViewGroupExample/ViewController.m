//
//  ViewController.m
//  [1013]TableViewGroupExample
//
//  Created by celeste on 2016. 10. 13..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSDictionary *animalList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animalList = @{@"mam":@[@"Lion"],
                        @"bird":@[@"gugu",@"pigeon"],
                        @"fish":@[@"go",@"cham", @"cham2"]};
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *animalKeyArray = [self.animalList allKeys];
    NSArray *animalArray = [self.animalList objectForKey:animalKeyArray[section]];
    return animalArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.animalList allKeys].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *title = [self.animalList allKeys];
    return [title objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        NSLog(@"%ld", indexPath.row);
    }

    NSArray *allKeys = [self.animalList allKeys];    
    NSString *currentKey = [allKeys objectAtIndex:indexPath.section];
    NSArray *currentArray = [self.animalList objectForKey:currentKey];
    NSString *currentValue = [currentArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentValue;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
