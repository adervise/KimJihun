//
//  ViewController.h
//  [1028]MyImagePickerByYagom
//
//  Created by celeste on 2016. 10. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


- (IBAction)imagePicker:(UITapGestureRecognizer *)sender;

@end

