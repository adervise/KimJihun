//
//  SettingViewController.m
//  SettingsExample
//
//  Created by JoSeongGyu on 2016. 10. 29..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "SettingViewController.h"

NS_ENUM(NSInteger) {
    tagSliderRed = 100,
    tagSliderGreen,
    tagSliderBlue
};

NS_ENUM(NSInteger) {
    sizeSegmentIndexSmall,
    sizeSegmentIndexMedium,
    sizeSegmentIndexLarge
};

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *previewLabel;

@end

@implementation SettingViewController

- (IBAction)colorSliderValueChanged:(UISlider *)sender {
   
    UISlider *redSlider = [[self view] viewWithTag:tagSliderRed];
    UISlider *greenSlider = [[self view] viewWithTag:tagSliderGreen];
    UISlider *blueSlider = [[self view] viewWithTag:tagSliderBlue];
    
    if (([redSlider isKindOfClass:[UISlider class]] &&
        [greenSlider isKindOfClass:[UISlider class]] &&
        [blueSlider isKindOfClass:[UISlider class]]) == NO ) {
        return;
    }
    
    float redValue = redSlider.value;
    float greenValue = greenSlider.value;
    float blueValue = blueSlider.value;
    
    UIColor *color = [UIColor
                      colorWithRed:redValue
                      green:greenValue
                      blue:blueValue
                      alpha:1.f];
    
    [[self previewLabel] setTextColor:color];
}


- (IBAction)sizeSegmentValueChanged:(UISegmentedControl *)sender {
    
    UIFont *font = nil;
    
    switch ([sender selectedSegmentIndex]) {
        case sizeSegmentIndexSmall:
            font = [UIFont systemFontOfSize:10.f];
            break;
            
        case sizeSegmentIndexMedium:
            font = [UIFont systemFontOfSize:15.f];
            break;
            
        case sizeSegmentIndexLarge:
            font = [UIFont systemFontOfSize:20.f];
            break;
    }
    
    if (font) {
        [[self previewLabel] setFont:font];
    }
}


- (IBAction)clickSaveButton:(id)sender {
    
    if ([self previewLabel] == nil ||
        [[self previewLabel] font] == nil ||
        [[self previewLabel] textColor] == nil) {
        return;
    }
    
    NSDictionary *userInfo = @{UserInfoKeyLabelFont : self.previewLabel.font,
                            UserInfoKeyLabelTextColor : self.previewLabel.textColor};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeSettingNotification
                                    object:self
                                    userInfo:userInfo];
 
    [self.navigationController popViewControllerAnimated:YES];
}

@end
