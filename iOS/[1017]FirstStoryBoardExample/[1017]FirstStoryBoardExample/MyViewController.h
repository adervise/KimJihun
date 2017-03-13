//
//  MyViewController.h
//  [1017]FirstStoryBoardExample
//
//  Created by celeste on 2016. 10. 17..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@property (strong, nonatomic) IBOutlet UITextField *myTxtFiled;

@property (strong, nonatomic) IBOutlet UISlider *mySlider;

@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;

@property (strong, nonatomic) IBOutlet UIView *colorView;

@property (strong, nonatomic) IBOutlet UISlider *redValue;

@property (strong, nonatomic) IBOutlet UISlider *greenValue;

@property (strong, nonatomic) IBOutlet UISlider *blueValue;



- (IBAction)MyButton:(id)sender;





@end
