//
//  ViewController.h
//  [1011]TextFiledExample
//
//  Created by celeste on 2016. 10. 11..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textInput;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;



- (IBAction)signUpAction:(id)sender ;

@end

