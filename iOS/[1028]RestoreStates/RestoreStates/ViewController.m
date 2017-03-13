//
//  ViewController.m
//  RestoreStates
//
//  Created by JoSeongGyu on 2016. 10. 27..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ViewController.h"

static NSString *UserInputText = @"UserInputText";

@interface ViewController () 

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property NSString *userInputText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"_____ view will appear %d", self.userInputText != nil);
    
    if (self.userInputText != nil) {
        self.textField.text = self.userInputText;
        self.userInputText = nil;
    }
}


- (IBAction)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    NSLog(@"_____ ENCODE state %@", self.textField.text);
    [coder encodeObject:self.textField.text forKey:UserInputText];
}


- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    NSString *text = [coder decodeObjectForKey:UserInputText];
    NSLog(@"_____ DECODE state %@", text);
    self.userInputText = text;
}



@end
