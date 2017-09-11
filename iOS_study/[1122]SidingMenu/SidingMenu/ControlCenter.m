//
//  MenuControlCenter.m
//  SidingMenu
//
//  Created by youngmin joo on 2016. 11. 21..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ControlCenter.h"
#import "MenuViewController.h"
#import "DetailViewController.h"

@implementation ControlCenter

//싱글톤
+ (instancetype)defaultCenter {
    static ControlCenter *center;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[ControlCenter alloc] init];
    });
    
    return center;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        //sampleData
        self.menuList =@[@"menu1",@"menu2",@"menu3"];
        self.controlPanel = [[SVSlidingPanelViewController alloc] init];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        MenuViewController *menu = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
        menu.menuTitleList = self.menuList;
        self.controlPanel.leftPanel = menu;
        
        menu.didSelectedBlock = ^(MenuOptions menuType){
            [self showScreenForMenuOption:menuType animation:YES];
        };
        
        DetailViewController *detailView = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:detailView ];
        
        self.controlPanel.centerPanel = navigation;
    }
    return self;
}

- (void)showScreenForMenuOption:(MenuOptions)optionType animation:(BOOL)animated {
    
    UINavigationController *navi = (UINavigationController *)self.controlPanel.centerPanel;
    DetailViewController *detailVC = (DetailViewController*)navi.viewControllers.firstObject;
    //dataSet
    
    [detailVC.titleLB setText:[self.menuList objectAtIndex:optionType]];
    [self.controlPanel showCenterPanelAnimation:animated];
}


@end
