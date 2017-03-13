//
//  ViewController.h
//  [1115]NetworkingMiniProject
//
//  Created by celeste on 2016. 11. 15..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
     NSArray *dataList;
}

@property (strong, nonatomic) IBOutlet UINavigationItem *idLabel;
- (IBAction)addImage:(id)sender;
- (IBAction)imageList:(id)sender;

@end

