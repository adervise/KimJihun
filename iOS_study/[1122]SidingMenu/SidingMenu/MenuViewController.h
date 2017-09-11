//
//  MenuViewController.h
//  SidingMenu
//
//  Created by youngmin joo on 2016. 11. 21..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeDefHeader.h"

@interface MenuViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *menuView;
@property (nonatomic) MenuBlock didSelectedBlock;
@property (nonatomic,strong) NSArray *menuTitleList;

@end
