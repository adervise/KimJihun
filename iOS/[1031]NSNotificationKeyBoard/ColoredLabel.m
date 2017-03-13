//
//  ColoredLabel.m
//  [1031]NSNotificationKeyBoard
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ColoredLabel.h"

@implementation ColoredLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveSettingChange:)
                                    name:@"textSetting"
                                    object:nil];
}

- (void)didReceiveSettingChange:(NSNotification *)noti {
    
    UIColor *color = [[noti userInfo] objectForKey:@"color"];
    UIFont *font = [[noti userInfo] objectForKey:@"font"];
    NSLog(@"%@",color);

    if ([color isKindOfClass:[UIColor class]] &&
        [font isKindOfClass:[UIFont class]]) {
        [self setTextColor:color];
        [self setFont:font];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
