//
//  MenuControlCenter.h
//  SidingMenu
//
//  Created by youngmin joo on 2016. 11. 21..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVSlidingPanelViewController.h"
#import "TypeDefHeader.h"



@interface ControlCenter : NSObject

@property (nonatomic, strong) SVSlidingPanelViewController *controlPanel;
@property (nonatomic) NSArray *menuList;

//싱글톤
+(instancetype)defaultCenter;

@end
