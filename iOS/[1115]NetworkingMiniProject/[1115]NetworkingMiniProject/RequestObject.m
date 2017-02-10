//
//  RequestObject.m
//  [1115]NetworkingMiniProject
//
//  Created by celeste on 2016. 11. 15..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "RequestObject.h"

@implementation RequestObject

+ (id)sharedManager {
    
    static RequestObject *instatnce = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instatnce = [[self alloc] init];
    });
    return instatnce;
}


- (void)requestImageList {
    
    // session 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    // Request 생성
    NSURL *url = [NSURL URLWithString:@"http://iosschool.yagom.net:8080/api/list?user_id=200"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",data);
    }];
    
    [task resume];
}


- (void)requestUploadImage:(NSData *)imageData {
    
}

@end
