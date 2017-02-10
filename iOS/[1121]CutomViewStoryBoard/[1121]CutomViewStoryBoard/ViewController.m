//
//  ViewController.m
//  [1121]CutomViewStoryBoard
//
//  Created by celeste on 2016. 11. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@property NSMutableArray *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.timer.count;
}


// Cell 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.timer objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UINavigationController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"];
    [self.navigationController pushViewController:svc animated:YES];
}


- (IBAction)addTime:(id)sender {
    
    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/mm/dd hh:mm:ss"];
    [self.timer addObject:[formatter stringFromDate:date]];
    [self.dataTable reloadData];
    
}

- (IBAction)refreshData:(id)sender {
    [self.timer removeAllObjects];
    [self.dataTable reloadData];
}
@end
