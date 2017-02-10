//
//  RequestObject.h
//  [1116]NetworkingMiniProjectSecond
//
//  Created by celeste on 2016. 11. 16..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject

+ (void)requsetImageList;
+ (void)requsetUploadImage:(UIImage *)image title:(NSString *)title;

@end
