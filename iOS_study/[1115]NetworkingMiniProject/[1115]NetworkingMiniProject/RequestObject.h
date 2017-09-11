//
//  RequestObject.h
//  [1115]NetworkingMiniProject
//
//  Created by celeste on 2016. 11. 15..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestObject : NSObject

+ (id)sharedManager;
- (void)requestImageList;

@end
