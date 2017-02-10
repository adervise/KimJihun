//
//  RequestObject.h
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject

+ (void)requestImageList;
+ (void)requestUploadImage:(UIImage *)image title:(NSString *)title originImageId:(NSString *)imageId;
+ (void)requestDeleteImage:(NSString *)imageId;

@end
