//
//  ViewController.m
//  [1104]pListExample
//
//  Created by celeste on 2016. 11. 3..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *loadedData = [self loadList];
    if (loadedData) {
        self.dataList = [[NSMutableArray alloc] initWithArray:loadedData];
    } else {
        self.dataList = [[NSMutableArray alloc] init];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionBtn:(id)sender {
    
    NSString *name = self.tf.text;
    [self.dataList addObject:name];
    
    //테이블 뷰 로드
    [self.tv reloadData];
    
    //데이터 저장
    [self listSave:self.dataList];
}

//plist에 저장하기
- (void)listSave:(NSArray *)list {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingString:@"tableList.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath:filePath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"tableList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:filePath error:nil];
    }

    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
//    [dic setValue:list forKey:@"friend_name"];
    [dic setObject:list forKey:@"friend_name"];
    [dic writeToFile:filePath atomically:YES];
}

//plist에서 불러오기
- (NSArray *)loadList {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingString:@"tableList.plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *nameList = [dic objectForKey:@"friend_name"];
    return nameList;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataList[indexPath.row]];
    
    return cell;
}


@end
