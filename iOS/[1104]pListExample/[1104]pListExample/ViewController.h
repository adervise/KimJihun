//
//  ViewController.h
//  [1104]pListExample
//
//  Created by celeste on 2016. 11. 3..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *tf;
@property (strong, nonatomic) IBOutlet UITableView *tv;
@property NSMutableArray *dataList;
- (IBAction)actionBtn:(id)sender;

@end

