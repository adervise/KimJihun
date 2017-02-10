//
//  SecondViewController.h
//  [1121]CutomViewStoryBoard
//
//  Created by celeste on 2016. 11. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *cellImage;
@property (strong, nonatomic) IBOutlet UILabel *cellLabel;


@end
