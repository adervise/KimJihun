//
//  SecondViewController.m
//  [1121]CutomViewStoryBoard
//
//  Created by celeste on 2016. 11. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "SecondViewController.h"
#import "TableViewCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

// Cell 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondCell" forIndexPath:indexPath];
    
    SecondViewController __weak *wself = self;
    NSURL *thumbnailURL = [NSURL URLWithString:@"https://tv.pstatic.net/thm?size=f202x152&quality=9&q=http://imgauto.naver.com/20160427_256/auto_1461737285114Nr7HR_JPEG/20160427150750_RplTLaao.jpg"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithURL:thumbnailURL
                                    completionHandler:^(NSData * _Nullable data,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
                                        
                                        if (data) {
                                            UIImage *image = [UIImage imageWithData:data];
                                            if (image) {
                                                dispatch_sync(dispatch_get_main_queue(), ^{
                                                    cell.textLabel.text = @"친구";
                                                    cell.imageView.image = image;
                                                });
                                            }
                                        }
                                    }];
    [task resume];
    
    cell.textLabel.text = [NSString stringWithFormat:@"TEST"];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}

@end
