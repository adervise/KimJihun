//
//  AutomicField.m
//  [1031]PrecompiledHeaderExample
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "AutomicField.h"

@interface AutomicField () <UITextFieldDelegate>
@end


@implementation AutomicField

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"awakeFromNib_AutomicField");
    if ([self delegate] == nil) {
        [self setDelegate:self];
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField endEditing:YES];
    return YES;
}


@end
