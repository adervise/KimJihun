//
//  TypeDefHeader.h
//  SidingMenu
//
//  Created by youngmin joo on 2016. 11. 21..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#ifndef TypeDefHeader_h
#define TypeDefHeader_h

typedef enum NSInteger
{
    MenuOptions1 = 0,
    MenuOptions2,
    MenuOptions3
}MenuOptions;

typedef void(^MenuBlock)(MenuOptions menuType);


#endif /* TypeDefHeader_h */
