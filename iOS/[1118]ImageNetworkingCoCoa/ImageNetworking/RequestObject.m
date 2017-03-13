//
//  RequestObject.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "RequestObject.h"
#import <AFNetworking.h>

typedef NS_ENUM(NSInteger, RequestType) {
    RequestTypeImageList,
    RequestTypeUploadImage,
    RequestTypeDeleteImage
};

static NSString *const baseURLString = @"http://iosschool.yagom.net:8080/";
static NSString *ParamNameUserIDKey = @"user_id";
static NSString *ParamNameImageTitleKey = @"title";
static NSString *ParamNameImageDataKey = @"image_data";
static NSString *ParamNameImageIdKey = @"image_id";
static NSString *JSONContentKey = @"list";
static NSString *JSONResultKey = @"result";
static NSString *JSONSuccessValue = @"success";

@implementation RequestObject

+ (NSURL *)requestURL:(RequestType)type param:(NSDictionary *)paramDic {
    
    NSMutableString *urlString = [baseURLString mutableCopy];

    switch (type) {
        case RequestTypeImageList:
            [urlString appendString:@"api/list"];
            break;
        case RequestTypeUploadImage:
            [urlString appendString:@"api/upload"];
            break;
        case RequestTypeDeleteImage:
            [urlString appendString:@"api/image"];
            break;
        default:
            return nil;
            break;
    }
    
    if ([paramDic count]) {
        NSMutableString *paramString = [NSMutableString stringWithFormat:@"?"];
        
        for (NSString *key in paramDic) {
            [paramString appendString:key];
            [paramString appendString:@"="];
            
            id value = paramDic[key];
            
            if ([value isKindOfClass:[NSString class]]) {
                [paramString appendString:value];
            } else {
                value = [NSString stringWithFormat:@"%@", value];
                [paramString appendString:value];
            }
            [paramString appendString:@"&"];
        }
        
        [urlString appendString:paramString];
    }
    
    return [NSURL URLWithString:urlString];
}

+ (void)requestImageList {

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSDictionary *paramDic = @{ParamNameUserIDKey:[[UserInformation sharedUserInfo] userId]};
    NSURL *requestURL = [self requestURL:RequestTypeImageList
                                   param:paramDic];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:requestURL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        NSLog(@"response : %@, error : %@", response, error);
        NSString *notificationName = ImageListUpdateFailNotification;
        
        if (responseObject) {
            NSDictionary *dict = responseObject;
            
            if ([dict objectForKey:JSONContentKey] != nil) {
                NSLog(@"success");
                NSArray *contentArray = dict[JSONContentKey];
                [UserInformation sharedUserInfo].imageInfoJSONArray = contentArray;
                notificationName = ImageListUpdatedNotification;
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
        });
    }];
    
    [dataTask resume];
}

+ (void)requestUploadImage:(UIImage *)image title:(NSString *)title originImageId:(NSString *)imageId {
    
    NSString *requestURL = [[self requestURL:RequestTypeUploadImage param:nil] absoluteString];
    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
    [bodyParams setObject:[[UserInformation sharedUserInfo] userId] forKey:ParamNameUserIDKey];
    [bodyParams setObject:title forKey:ParamNameImageTitleKey];
    
    if (imageId) {
        [bodyParams setObject:imageId forKey:@"id"];
    }
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]
                                    multipartFormRequestWithMethod:@"POST"
                                    URLString:requestURL
                                    parameters:bodyParams
                                    constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                        [formData appendPartWithFileData:imageData
                                                                name:@"image_data"
                                                                fileName:@"image.jpeg"
                                                                mimeType:@"image/jpeg"];
                                    }
                                    error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          NSLog(@"uploading... %lf %% complete ", uploadProgress.fractionCompleted);
                      });
                  }
                  
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {

                      NSString *notificationName = ImageUploadDidFailNotification;
                      
                      if (error != nil) {
                          NSLog(@"Error occured : %@", error);
                      }
                      
                      if (responseObject) {
                          NSLog(@"Data dosen't exist");
                      }
                      
                      NSDictionary *dict = responseObject;
                      
                      if ([[dict objectForKey:JSONResultKey] isEqualToString:JSONSuccessValue]) {
                          notificationName = ImageUploadDidSuccessNotification;
                      }
                      
                      dispatch_async(dispatch_get_main_queue(), ^{
                          [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                          [[NSNotificationCenter defaultCenter] postNotificationName:notificationName
                                                                    object:nil
                                                                    userInfo:dict];
                      });
                  }];
    
    [uploadTask resume];
}

+ (void)requestDeleteImage:(NSString *)imageId {
    
    NSDictionary *paramDic = @{@"user_id":[[UserInformation sharedUserInfo] userId], @"image_id":imageId};
    NSURL *requestURL = [self requestURL:RequestTypeDeleteImage param:paramDic];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"DELETE"];
    [request setURL:requestURL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        NSLog(@"response : %@, error : %@", response, error);
        NSString *notificationName = ImageDeleteDidFailNotification;

        if (responseObject) {
            NSDictionary *dict = responseObject;
            
            if ([[dict objectForKey:JSONResultKey] isEqualToString:JSONSuccessValue]) {
                NSLog(@"success");
                [self requestImageList];
                notificationName = nil;
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (notificationName) {
                [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
            }
        });
    }];
    
    [dataTask resume];
}

@end
