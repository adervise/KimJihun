//
//  ViewController.h
//  [1027]GestureRecognizerExample
//
//  Created by celeste on 2016. 10. 27..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *gestureRecognizer;

@property (strong, nonatomic) IBOutlet UILabel *clickCount;

@property (strong, nonatomic) IBOutlet UILabel *coordinateText;

- (IBAction)clickView:(UITapGestureRecognizer *)sender;

@end

