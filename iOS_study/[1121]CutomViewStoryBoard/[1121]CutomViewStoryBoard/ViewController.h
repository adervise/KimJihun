//
//  ViewController.h
//  [1121]CutomViewStoryBoard
//
//  Created by celeste on 2016. 11. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *dataTable;
- (IBAction)addTime:(id)sender;
- (IBAction)refreshData:(id)sender;


@end

