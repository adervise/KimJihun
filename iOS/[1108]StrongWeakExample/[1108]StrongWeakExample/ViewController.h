//
//  ViewController.h
//  [1108]StrongWeakExample
//
//  Created by celeste on 2016. 11. 8..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *weakLabel;

@property (strong, nonatomic) IBOutlet UILabel *strongLabel;

- (IBAction)reAdd:(id)sender;


- (IBAction)remove:(id)sender;

@end

