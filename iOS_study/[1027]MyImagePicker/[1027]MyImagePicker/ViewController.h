//
//  ViewController.h
//  [1027]MyImagePicker
//
//  Created by celeste on 2016. 10. 27..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/*! @brief image를 출력할 부분 */
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

/*!
 * @discussion view를 클릭했을 때 imagePicker를 호출하여 imageView 부분에 이미지를 출력하게끔 구현
 * @param sender
 * @return present
 */
- (IBAction)clickView:(UITapGestureRecognizer *)sender;

@end

