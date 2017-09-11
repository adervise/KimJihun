//
//  ViewController.h
//  [1107]ValueObserving
//
//  Created by celeste on 2016. 11. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextLabel;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic, readonly) IBOutlet NSString *fullName;
@property (strong, nonatomic) IBOutlet UILabel *changeLabel;
@property NSInteger count;

- (IBAction)countButton:(id)sender;
- (IBAction)nameLog:(id)sender;


@end

