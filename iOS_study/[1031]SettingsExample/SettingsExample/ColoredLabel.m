//
//  ColoredLabel.m
//  SettingsExample
//
//  Created by JoSeongGyu on 2016. 10. 29..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ColoredLabel.h"

@implementation ColoredLabel



- (void)awakeFromNib {
    [super awakeFromNib];
    
    // notification center에 등록해서 noti가 올 경우에 함수를 호출하겠다.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveSettingChange:)
                                    name:DidChangeSettingNotification
                                    object:nil];
}


- (void)didReceiveSettingChange:(NSNotification *)noti {
    
    UIColor *color = [[noti userInfo] objectForKey:UserInfoKeyLabelTextColor];
    UIFont *font = [[noti userInfo] objectForKey:UserInfoKeyLabelFont];
    
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
