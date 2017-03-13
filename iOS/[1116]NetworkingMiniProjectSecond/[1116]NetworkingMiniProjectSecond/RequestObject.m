//
//  RequestObject.m
//  [1116]NetworkingMiniProjectSecond
//
//  Created by celeste on 2016. 11. 16..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "RequestObject.h"

@implementation RequestObject


+ (void)requsetImageList {
    
    NSString *userId = [[UserInformation sharedUserInfo] userId];
    NSString *destinationURLString = [NSString stringWithFormat:@"http://iosschool.yagom.net:8080/api/list?user_id=%@",userId];
    
    NSURL *destinationURL = [NSURL URLWithString:destinationURLString];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:destinationURL];
    
    id taskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"requset Image List Response :%@, error : %@", response, error);
        NSError *jsonParsingError;
        NSDictionary *jsonResult = [NSJSONSerialization
                                    JSONObjectWithData:data
                                    options:NSJSONReadingMutableLeaves
                                    error:&jsonParsingError];
        
        NSLog(@"json Parsing Error : %@ , json result : %@",jsonParsingError, jsonResult);
        
        NSArray *imageInfoList = [jsonResult objectForKey:@"list"];
        [[UserInformation sharedUserInfo] setImageInfoList:imageInfoList];
        
        NSString *notificationName = nil;
        if (imageInfoList == nil) {
            notificationName = ImageListUpdatedFailNotification;
        } else {
            notificationName = ImageListUpdatedNotification;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
        });
    };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:taskHandler];
    [dataTask resume];
}

+ (void)requsetUploadImage:(UIImage *)image title:(NSString *)title {
    
    NSString *userId = [[UserInformation sharedUserInfo] userId];
    NSString *destinationURLString = [NSString stringWithFormat:@"http://iosschool.yagom.net:8080/api/upload"];
    
    NSURL *destinationURL = [NSURL URLWithString:destinationURLString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:destinationURL];
    
    NSString *boundaryString = @"----------celeste";
    NSString *contentDescription = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundaryString];
    [request addValue:contentDescription forHTTPHeaderField:@"Content-Type"];

    NSData *boundaryData = [[NSString stringWithFormat:@"--%@\r\n", boundaryString] dataUsingEncoding:NSUTF8StringEncoding];

    // 바디 데이터 생성
    NSMutableData *bodyData = [[NSMutableData alloc] init];

    // 버디 데이터에 바운데리추가
    [bodyData appendData:boundaryData];
    
    // user_id 파라미터 정보 추가
    NSData *nameData = [@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *valueData = [[NSString stringWithFormat:@"%@\r\n",userId] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];

    // 바운더리 추가
    [bodyData appendData:boundaryData];
    
    // title (이미지 제목) 추가
    nameData = [@"Content-Disposition: form-data; name=\"title\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    valueData = [[NSString stringWithFormat:@"%@\r\n",title] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];

    // 바운더리 추가
    [bodyData appendData:boundaryData];
    
    // 이미지 정보 추가
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *imageContentTypeData = [@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [bodyData appendData:imageData];
    
    // 마지막 바운데리 추가
    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\r\n--%@--\r\n",boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:finishBoundaryData];
    
    // 이미지 파일이 있기 때문에 로그가 안찍힌다. 그러나!!! 이미지 부분만 해제하면 텍스트를 확인할 수 있다.
    NSString *bodyDataString = [[NSString alloc] initWithData: bodyData encoding:NSUTF8StringEncoding];
    NSLog(@"Logstring %@",bodyDataString);
    
    [request setHTTPBody:bodyData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    id uploadHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error occured : %@",error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data dosen't exist ");
            return;
        }
    
        NSDictionary *jsonResult = [NSJSONSerialization
                                    JSONObjectWithData:data
                                    options:NSJSONReadingMutableLeaves
                                    error:nil];
        NSLog(@"jsonResult%@",jsonResult);
    
        if ([[jsonResult objectForKey:@"result"] isEqualToString:@"success"]) {
            [self requsetImageList];
        }
    };
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                              fromData:nil
                                              completionHandler:uploadHandler];
    [uploadTask resume];
}
@end
