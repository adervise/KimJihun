//
//  ViewController.h
//  [1031]NSNotificationKeyBoard
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ViewController : UIViewController

// NsNotificationCenter 실습1 관련 속성 및 메소드
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UILabel *frameLabel;
- (IBAction)tabBackground:(id)sender;



// NsNotificationCenter 실습2 관련 속성 및 메소드

@property (strong, nonatomic) IBOutlet UILabel *labelResult;


@property (strong, nonatomic) IBOutlet UILabel *labelValue;

@property (strong, nonatomic) IBOutlet UISlider *redValue;
@property (strong, nonatomic) IBOutlet UISlider *greenValue;
@property (strong, nonatomic) IBOutlet UISlider *blueValue;
@property (strong, nonatomic) IBOutlet UISegmentedControl *textSizeValue;

- (IBAction)sliderChange:(id)sender;
- (IBAction)segmentChange:(id)sender;
- (IBAction)saveSetting:(id)sender;


@end

