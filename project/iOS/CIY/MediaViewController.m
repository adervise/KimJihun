//
//  MediaViewController.m
//  CarIsYou
//
//  Created by clmns on 2017. 4. 18..
//  Copyright © 2017년 clmns. All rights reserved.
//

#import "MediaViewController.h"
#import "ViewController.h"
#import <AFNetworking.h>
#import <JGProgressHUD.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <KakaoLink/KakaoLink.h>


@interface MediaViewController () <UIWebViewDelegate, UIWebViewDelegate, UINavigationControllerDelegate>

@property BOOL photoAllow;
@property BOOL restrictRotation;

@end

@implementation MediaViewController


- (BOOL)shouldAutorotate {
    
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (void)viewDidLoad {
    
    
    
    self.loadingMediaWV.hidden = YES;
    self.mediaWebView.delegate = self;
    
    [super viewDidLoad];
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    [self shouldAutorotate];
    [self supportedInterfaceOrientations];

    NSLog(@"✴️viewDidLoad Finish %@",self.mediaURL);
    NSString *mainURL = @"http://m.carisyou.com";
    NSURL *url = [NSURL URLWithString:[mainURL stringByAppendingString:self.mediaURL]];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.mediaWebView loadRequest:requestObj];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSLog(@"✴️ shouldStartLoadWithRequest Start ✴️");
    
    NSString *path = [request.URL relativePath];
    NSRange rangeFound = [path rangeOfString:@"jscall"];
    
    if (rangeFound.location != NSNotFound && rangeFound.length > 0) {
        NSArray *arrData = [path componentsSeparatedByString:@"|@|"];
        NSLog(@"💡jsCall Path:%@ 💡",path);
        if ([arrData count] > 1) {
            
            // 마이메뉴 -> 설정창 눌렀을 때 자바스크립트 받아서 메소드 호출
            if ([arrData[1] isEqualToString:@"downImage"]) {

                NSString *downloadURL = arrData[3];
                NSLog(@"downImage / URL : %@ " ,downloadURL);
                [self networking:downloadURL];
                
            } else if ([arrData[1] isEqualToString:@"closeGallery"]) {
                [self closeGallery:arrData[2]];
            } 
            
            
        }
        NSLog(@"✴️ (rangeFound.location !=) -> return NO");
        return NO;
    }
    NSLog(@"✴️ shouldStartLoadWithRequest -> return YES");
    return YES;
}




-(void) checkCameraAuthorization {
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if(status == AVAuthorizationStatusAuthorized) { // authorized
        NSLog(@"camera authorized");
    }
    else if(status == AVAuthorizationStatusDenied){ // denied
        if ([AVCaptureDevice respondsToSelector:@selector(requestAccessForMediaType: completionHandler:)]) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                // Will get here on both iOS 7 & 8 even though camera permissions weren't required
                // until iOS 8. So for iOS 7 permission will always be granted.
                
                NSLog(@"DENIED");
                
                if (granted) {
                    // Permission has been granted. Use dispatch_async for any UI updating
                    // code because this block may be executed in a thread.
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //[self doStuff];
                    });
                } else {
                    // Permission has been denied.
                    NSLog(@"AVAuthorizationStatusDenied");

                }
            }];
        }
    }
    else if(status == AVAuthorizationStatusRestricted){ // restricted
        
        NSLog(@"AVAuthorizationStatusRestricted");
        
    }
    else if(status == AVAuthorizationStatusNotDetermined){ // not determined
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(granted){ // Access has been granted ..do something
                NSLog(@"camera authorized");
            } else { // Access denied ..do something
                NSLog(@"requestAccessForMediaType");
            }
        }];
    }
}


- (void)closeGallery:(NSString *)goDetailViewURL {
    
    if (![goDetailViewURL isEqualToString:@""]) {
        NSString *URL = [NSString stringWithFormat:@"http://m.carisyou.com%@",goDetailViewURL];
        NSDictionary *dic = [NSDictionary dictionaryWithObject:URL forKey:@"pageURL"];
        NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
        [noti postNotificationName:@"saverURL" object:self userInfo:dic];
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self.navigationController popViewControllerAnimated:YES];
}



- (void) photolibraryAllowMessage {
    
    NSLog(@"😎😎 authorizationStatus4 %ld 😎😎", [PHPhotoLibrary authorizationStatus]);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"카이즈유"
                                                                   message:@"사진접근이 허용되지 않아,\n 사진을 앨범에 저장할 수 없습니다.\n 단말기의 [설정>개인정보보호>사진]에서 \n 카이즈유의 설정상태를 확인해 주세요."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {}];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)downloadImage:(NSString *)downloadURL {
    
    
    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    JGProgressHUD *HUD2 = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue, ^{
      
        self.loadingMediaWV.hidden = NO;
        HUD.textLabel.text = @"Downloading";
        [HUD showInView:self.view];
    });
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:downloadURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
     
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            
            dispatch_async(mainQueue, ^{
               [HUD dismiss];
//                JGProgressHUD *HUD2 = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
                HUD2.textLabel.text = @"Error";
                HUD2.indicatorView = [[JGProgressHUDErrorIndicatorView alloc] init]; //JGProgressHUDSuccessIndicatorView is also available
                [HUD2 showInView:self.view];
                [HUD2 dismissAfterDelay:1.0];
                self.loadingMediaWV.hidden = YES;

            });

            
            
        } else {
            
            NSLog(@"File downloaded to: %@", filePath);
            NSData *data = [NSData dataWithContentsOfURL:filePath];
            UIImage *image = [[UIImage alloc] initWithData:data];
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
            
            dispatch_async(mainQueue, ^{
                [HUD dismiss];
                
                HUD2.textLabel.text = @"Success";
                HUD2.indicatorView = [[JGProgressHUDSuccessIndicatorView alloc] init]; //JGProgressHUDSuccessIndicatorView is also available
                [HUD2 showInView:self.view];
                [HUD2 dismissAfterDelay:1.0];
                self.loadingMediaWV.hidden = YES;
            });

            
        }
        
    }];
    [downloadTask resume];
}


- (void)networking:(NSString *)downloadURL {
    
    NSLog(@" 😎 PHPhotoLibrary authorizationStatus1 %ld", [PHPhotoLibrary authorizationStatus]);
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{

    } completionHandler:^(BOOL success, NSError * _Nullable error) {
    
        NSLog(@" 😎😎 PHPhotoLibrary authorizationStatus %ld", [PHPhotoLibrary authorizationStatus]);
        if (error) {
            
            if ([PHPhotoLibrary authorizationStatus] == 2 ) {
                 NSLog(@" 😎😎😎😎 PHPhotoLibrary authorizationStatus %ld", [PHPhotoLibrary authorizationStatus]);
                [self photolibraryAllowMessage];

            }

        } else if (success) {
            NSLog(@" 😎😎😎😎😎 PHPhotoLibrary authorizationStatus %ld", [PHPhotoLibrary authorizationStatus]);
            [self downloadImage:downloadURL];
        }
    }];
}



- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");

    JGProgressHUD *HUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    HUD.textLabel.text = @"Loading";
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.0];
}

// 웹뷰 로드가 끝났을 때 로딩 인디케이터 종료 & 가리기
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
}

// 화면 내릴 때 원래위치로 돌리기
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
}



@end
