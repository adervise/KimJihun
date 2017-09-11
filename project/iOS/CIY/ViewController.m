//
//  ViewController.m
//  CarIsYou
//
//  Created by clmns on 2017. 3. 15..
//  Copyright © 2017년 clmns. All rights


#import "ViewController.h"
#import "UserOrderManagerViewController.h"
#import "NotiSettingViewController.h"
#import "MediaViewController.h"
#import <SVProgressHUD.h>
#import <JGProgressHUD.h>
#import <KeychainItemWrapper.h>
#import <AFNetworking.h>
#import <KakaoLink/KakaoLink.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "Reachability.h"


@import Firebase;
@import FirebaseInstanceID;
@import FirebaseMessaging;

@interface ViewController () <UIWebViewDelegate, UIGestureRecognizerDelegate, UIWebViewDelegate, WKNavigationDelegate> {
    Reachability* internetReachable;    
    BOOL theBool;
    NSTimer *myTimer;

}

@property NSString *htmlSource;
/*! @마이메뉴에서 페이지 이동시 필요한 URL 저장시 필요  */
@property NSString *pageURL;
@property NSString *currentURL;
@property NSArray *noticeCheck;

@end

@implementation ViewController

#pragma mark - viewDidLoad

- (void)viewDidLoad {

    
    
    NSLog(@"check👳 %ld 👳", self.coachCheck.tag);
    [self.webProgress setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    self.coachMarkView.hidden = YES;
    self.loadingBackgound.hidden = YES;
    self.loadingImage.hidden = YES;
    self.autoLoginFlag = 0;
    [self versionCheck];
    [super viewDidLoad];
    
    
    // navigationBar 숨기기
    self.navigationController.navigationBar.hidden = YES;
    self.webView.delegate = self;

    // 리프레시 객체생성
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.webView.scrollView addSubview:refreshControl];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(checkNetworkStatus:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    internetReachable = [Reachability reachabilityForInternetConnection];
    [internetReachable startNotifier];
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    // Adding the swipe gesture on image view
    [self.webView addGestureRecognizer:swipeLeft];
    [self.webView addGestureRecognizer:swipeRight];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Left Swipe");
        
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Right Swipe");
        [self.webView goBack];
    }
    
}


- (IBAction)backTest:(id)sender {
    
    [self.webView goBack];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark handleRefresh
- (void)handleRefresh:(UIRefreshControl *)refresh {
    
    [self.webView reload];
    [refresh endRefreshing];
}


#pragma mark - call Setting Story Board & URL Save
- (void)viewWillAppear:(BOOL)animated {

    self.navigationController.navigationBar.hidden = YES;
    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
    // Load Notification Center  Data
    [noti addObserver:self selector:@selector(viewText:) name:@"saverURL" object:nil];
}


- (void)viewText:(NSNotification *)notification {

    self.pageURL = [[notification userInfo] objectForKey:@"pageURL"];
    self.webView.delegate = self;
    NSString *mainURL = self.pageURL;
    NSLog(@"%@", self.pageURL);
    NSURL *url = [NSURL URLWithString:mainURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark -  UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *path = [request.URL relativePath];
    NSLog(@"💡Path:%@ 💡",path);
    
    // 소셜미디어 아이콘 클릭했을 시 사파리로 해당 URL 호출
    NSRange rangeFoundFaceBook = [path rangeOfString:@"carisyounews"];
    NSRange rangeFoundInstagram = [path rangeOfString:@"carisyougram"];
    NSRange rangeFoundKaKao = [path rangeOfString:@"home/@카이즈유"];
    
    if (rangeFoundFaceBook.location != NSNotFound && rangeFoundFaceBook.length > 0) {
        [self.webView stopLoading];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://facebook.com/carisyounews/"]
                                           options:@{}
                                 completionHandler:nil];
    } else if (rangeFoundInstagram.location != NSNotFound && rangeFoundInstagram.length > 0) {
        [self.webView stopLoading];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://instagram.com/carisyougram/"]
                                           options:@{}
                                 completionHandler:nil];
    } else if (rangeFoundKaKao.location != NSNotFound && rangeFoundKaKao.length > 0) {
        [self.webView stopLoading];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://plus.kakao.com/home/%40%EC%B9%B4%EC%9D%B4%EC%A6%88%EC%9C%A0"]
                                           options:@{}
                                 completionHandler:nil];
    }

    // path 범위에서 jscall 찾기
    NSRange rangeFound = [path rangeOfString:@"jscall"];

        if (rangeFound.location != NSNotFound && rangeFound.length > 0) {
            NSArray *arrData = [path componentsSeparatedByString:@"|@|"];
            NSLog(@"💡💡jscall Path:%@ 💡💡",path);
   
            if ([arrData count] > 1) {

                // 마이메뉴 -> 설정창 눌렀을 때 자바스크립트 받아서 메소드 호출
                if ([arrData[1] isEqualToString:@"openConfig"]) {
                    [self callObjectiveCFromJavascriptOpenConfig:arrData[2] secondSetting:arrData[3]];
                // 마이메뉴 -> 알림창 눌렀을 때 자바스크립트 받아서 메소드 호출
                } else if ([arrData[1] isEqualToString:@"openAlarm"]) {
                    [self callObjectiveCFromJavascriptOpenAlarm];
                // document.ready에서 알람개수 받아옴.
                } else if ([arrData[1] isEqualToString:@"getAlarmCnt"])  {
                    NSLog(@"getAlarmCnt");
                // 마이메뉴 눌렀을 시 코치마크 출력
                } else if ([arrData[1] isEqualToString:@"checkCoachMark"])  {
                    NSLog(@"checkCoachMark");
                    [self callObjectiveCFromJavascriptOpenCoachMark];
                // 멀티미디어 -> 상세보기 눌렀을 시 호출
                }  else if([arrData[1] isEqualToString:@"openGallery"]) {
                    NSString *mediaURL = arrData[2];
                    NSLog(@"openGallery, %@", mediaURL);
                    [self callObjectiveCFromJavascriptMediaView:mediaURL];
                // 로그인 후 호출
                } else if ([arrData[1] isEqualToString:@"Login"])  {
                    NSLog(@"Login JS, method:%@, memberNo:%@, URL:%@",arrData[1], arrData[2], arrData[3]);
                    [self login:arrData[2] afterLoginGotoURL:arrData[3]];
                // 로그아웃 안햇을 때 시 오토로그인 실행
                } else if ([arrData[1] isEqualToString:@"hideLogin"])  {
                    NSLog(@"hideLogin");
                // 와이파이 상태에 따른 멀티미디어 사진보기 알림창 제어
                } else if ([arrData[1] isEqualToString:@"WifiConn"]) {
                    [self wifiCheck];
                // 로그아웃
                } else if ([arrData[1] isEqualToString:@"Logout"])  {
                    [self logout];
                }
            }
            return NO;
        }
    return YES;
}

#pragma mark - call setting WebViewDelegate
// 웹뷰 로드가 시작되었을 때 로딩 인디케이터 시작
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    self.webProgress.progress = 0;
    self.webProgress.hidden = false;
    theBool = false;
    //0.01667 is roughly 1/60, so it will update at 60 FPS
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
}

-(void)timerCallback {

    if (theBool) {
        if (self.webProgress.progress >= 1) {
            self.webProgress.hidden = true;
            [myTimer invalidate];
        } else {
            self.webProgress.progress += 0.1;
        }
    } else {
        self.webProgress.progress += 0.05;
        if (self.webProgress.progress >= 0.95) {
            self.webProgress.progress = 0.95;
        }
    }
}

// 웹뷰 로드가 끝났을 때 로딩 인디케이터 종료 & 가리기
- (void)webViewDidFinishLoad:(UIWebView *)webView {

    theBool = true;

    if (self.autoLoginFlag == 1) {
        [self autoHideLogin];
    }
}

#pragma mark - call Javascript Method

- (void)callObjectiveCFromJavascriptOpenCoachMark {
    
    NSString *ver = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    NSString *setVersion = [NSString stringWithFormat:@"setVersion('%@')",ver];
    [self.webView stringByEvaluatingJavaScriptFromString:setVersion];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"coachMarkStatus"] == YES) {
        self.coachMarkView.hidden = YES;
    } else {
        self.coachMarkView.hidden = NO;
    }
}

// 닫기
- (IBAction)coachMarckClose:(id)sender {
    
    
    NSUserDefaults *coachMarkStatus = [NSUserDefaults standardUserDefaults];
    [coachMarkStatus setBool:self.coachMarkStatus forKey:@"coachMarkStatus"];
    self.coachMarkView.hidden = YES;
}

- (IBAction)coachMarkCheck:(id)sender {

    if (self.coachCheck.tag == 0) {
        self.coachCheck.tag = 1;
        self.coachMarkStatus = YES;
        [self.coachCheck setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    } else {
        self.coachCheck.tag = 0;
        self.coachMarkStatus = NO;
        [self.coachCheck setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    }
    NSLog(@"check2👳 %ld 👳", self.coachCheck.tag);
}




- (void)callObjectiveCFromJavascriptOpenAlarm {
    UserOrderManagerViewController *orderController = [[UserOrderManagerViewController alloc] init];
    [self.navigationController pushViewController:orderController animated:YES];
}

// 설정창 오픈
- (void)callObjectiveCFromJavascriptOpenConfig:(NSString *)pushSetting secondSetting:(NSString *)marketingSetting {
    NSLog(@"called objective-c from javascript");
    
    // config 받아서 설정창 열었을 때 BOOL YES NO Check 하기
    BOOL pushAllow, marketingAllow;
    if ([pushSetting isEqualToString:@"Y"]) {
        pushAllow = YES;
    } else {
        pushAllow = NO;
    }
    
    if ([marketingSetting isEqualToString:@"Y"]) {
        marketingAllow = YES;
    } else {
        marketingAllow = NO;
    }
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NotiSettingViewController *notiVC = [storyBoard instantiateViewControllerWithIdentifier:@"SettingStoryBoard"];
    notiVC.pushAllow = pushAllow;
    notiVC.marketingAllow = marketingAllow;
    [self.navigationController pushViewController:notiVC animated:YES];
}

// 멀티미디어 갤러리 오픈
- (void)callObjectiveCFromJavascriptMediaView:(NSString *)mediaURL {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"media" bundle:nil];
    MediaViewController *mediaVC =   [storyBoard instantiateViewControllerWithIdentifier:@"MediaStoryBoard"];
    mediaVC.mediaURL = mediaURL;
    [self.navigationController pushViewController:mediaVC animated:YES];
}

// 로그인 후 네트워크를 통해서 서버에 정보전달
- (void)login:(NSString *)memberNumber afterLoginGotoURL:(NSString *)URL {
    
    self.autoLoginFlag = 2;
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"memberNum" accessGroup:nil];
    [keychain setObject:memberNumber forKey:(id)kSecAttrAccount];
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    
    NSString *URLString = @"http://m.carisyou.com/api/setconfig";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{@"memberNo":memberNumber, @"token":refreshedToken, @"setval":@"N||N||N"};
    [manager POST:URLString parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"🏓🏓🏓🏓🏓🏓🏓🏓🏓🏓JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
     
    if ([URL isEqualToString:@"http://m.carisyou.com"]) {
        NSString *mainURL = @"http://m.carisyou.com";
        NSURL *url = [NSURL URLWithString:mainURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObj];
    } else {
        NSString *mainURL = [NSString stringWithFormat:@"http://m.carisyou.com%@",URL];
        NSURL *url = [NSURL URLWithString:mainURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:requestObj];
    }
    
}

- (void)autoHideLogin {
    
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"memberNum" accessGroup:nil];
        NSString *userName = [keychain objectForKey: (id)kSecAttrAccount];
        NSLog(@"🎒 AutoHideLogin Start!!!! memberNo : %@, token :%@ 🎒", userName, [[FIRInstanceID instanceID] token]);
        
        if (![userName isEqualToString:@""]) {
            
            NSString *hideLoginValue = [NSString stringWithFormat:@"hideLogin('%@','%@')", userName, [[FIRInstanceID instanceID] token]];
            [self.webView stringByEvaluatingJavaScriptFromString:hideLoginValue];
            self.autoLoginFlag = 2;
            [self.webView reload];
            NSLog(@"🎒🎒🎒 Success Hide Login 🎒🎒🎒 ");
        }

}

- (void)logout {
    
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"memberNum" accessGroup:nil];
    [keychain resetKeychainItem];
//    NSString *userName = [keychain objectForKey: (id)kSecAttrAccount];
//    NSLog(@"🎒 Logout Start!!!! memberNo : %@, token :%@ 🎒", userName, [[FIRInstanceID instanceID] token]);
//    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self.webView reload];
}

// 버전 체크에 따른 업데이트 부분 처리해주기
- (void)versionCheck {

    self.loadingBackgound.hidden = NO;
    NSString *URLString = @"http://m.carisyou.com/api/appinfo";
    NSString *ver = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    self.autoLoginFlag = 1;
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{@"os": @"iOS", @"ver": ver};
    [manager POST:URLString parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        self.noticeCheck = responseObject;
        
        NSDictionary *dic = [self.noticeCheck objectAtIndex:0];
        NSString *notice = [dic objectForKey:@"notice"];
        NSString *updateYn = [dic objectForKey:@"updateYn"];
        NSString *serverAppVersion = [dic objectForKey:@"lastVersion"];
        
        if ([self compareVersion:ver toVersion:serverAppVersion]<0 && [updateYn isEqualToString:@"N"]) {
            
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"카이즈유"
                                                                           message:[NSString stringWithFormat:@"업데이트를 진행합니다."]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 
                                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/%EC%B9%B4%EC%9D%B4%EC%A6%88%EC%9C%A0-%EC%9E%90%EB%8F%99%EC%B0%A8-%ED%8F%AC%ED%84%B8-%EC%9E%90%EB%8F%99%EC%B0%A8%EC%A0%95%EB%B3%B4-%EA%B2%AC%EC%A0%81-%EC%8B%9C%EC%8A%B9%EA%B8%B0/id1229609586?l=ko&ls=1&mt=8"]
                                                                  
                                                                  
                                                                  
                                                                                                    options:@{}
                                                                                          completionHandler:nil];
                                                             }];

            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        } else if ([self compareVersion:ver toVersion:serverAppVersion]<0 && [updateYn isEqualToString:@"Y"]) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"카이즈유"
                                                                           message:[NSString stringWithFormat:@"업데이트를 진행하시겠습니까?"]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"YES"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 
                                                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/%EC%B9%B4%EC%9D%B4%EC%A6%88%EC%9C%A0-%EC%9E%90%EB%8F%99%EC%B0%A8-%ED%8F%AC%ED%84%B8-%EC%9E%90%EB%8F%99%EC%B0%A8%EC%A0%95%EB%B3%B4-%EA%B2%AC%EC%A0%81-%EC%8B%9C%EC%8A%B9%EA%B8%B0/id1229609586?l=ko&ls=1&mt=8"]
                                                                                                    options:@{}
                                                                                          completionHandler:nil];
                                                             }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"NO"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     
                                                                     NSString *mainURL = @"http://m.carisyou.com/?first=Y";
                                                                     NSURL *url = [NSURL URLWithString:mainURL];
                                                                     NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
                                                                     [self.webView loadRequest:requestObj];
                                                                 }];
            
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        } else if (![notice isEqualToString:@""]) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"카이즈유 공지사항"
                                                                           message:[NSString stringWithFormat:@"%@",notice]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                                 NSString *mainURL = @"http://m.carisyou.com/?first=Y";
                                                                 NSURL *url = [NSURL URLWithString:mainURL];
                                                                 NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
                                                                 [self.webView loadRequest:requestObj];
                                                             }];

            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        } else if ([self compareVersion:ver toVersion:serverAppVersion] >= 0 || [notice isEqualToString:@""]) {

            NSString *mainURL = @"http://m.carisyou.com/?first=Y";
            NSURL *url = [NSURL URLWithString:mainURL];
            NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
            [self.webView loadRequest:requestObj];

        }
        
        self.loadingBackgound.hidden = YES;

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSComparisonResult)compareVersion:(NSString*)versionOne toVersion:(NSString*)versionTwo {
    
    NSArray* versionOneComp = [versionOne componentsSeparatedByString:@"."];
    NSLog(@"version1: %@, versionOneComp : %@",versionOne,versionOneComp);
    
    NSArray* versionTwoComp = [versionTwo componentsSeparatedByString:@"."];
    NSLog(@"version2: %@, versionTwoComp :%@",versionOne ,versionTwoComp);
    
    
    NSInteger pos = 0;
    
    while ([versionOneComp count] > pos || [versionTwoComp count] > pos) {
        
        NSInteger v1 = [versionOneComp count] > pos ? [[versionOneComp objectAtIndex:pos] integerValue] : 0;
        NSLog(@"v1 : %ld, versionOneComp:%ld", v1, [versionOneComp count]);
        NSInteger v2 = [versionTwoComp count] > pos ? [[versionTwoComp objectAtIndex:pos] integerValue] : 0;
        NSLog(@"v2 : %ld, versionTwoComp:%ld", v2, [versionTwoComp count]);
        if (v1 < v2) {
            return NSOrderedAscending;
        } else if (v1 > v2) {
            return NSOrderedDescending;
        }
        pos++;
    }
    return NSOrderedSame;
}

// 최초 와이파이 상태 확인
- (void)wifiCheck {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if (status == ReachableViaWiFi) {
        NSLog(@"ReachableViaWiFi");
        [self.webView stringByEvaluatingJavaScriptFromString:@"isWifi(true)"];
    } else {
        [self.webView stringByEvaluatingJavaScriptFromString:@"isWifi(false)"];

    }

}

// 상태변화에 따른 와이파이 자바스크립트 콜
- (void)checkNetworkStatus:(NSNotification *)notice {
    // called after network status changes
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    NSString *currentURL = self.webView.request.URL.absoluteString;
    switch (internetStatus) {
        case NotReachable: {
            
            NSRange methodFound = [currentURL rangeOfString:@"/media/gallery"];
            if (methodFound.location != NSNotFound && methodFound.length > 0) {
                [self.webView stringByEvaluatingJavaScriptFromString:@"isWifi(false)"];
            }
            NSLog(@"The internet is down. %@",currentURL);
            break;
        }
        case ReachableViaWiFi: {
            
            NSRange methodFound = [currentURL rangeOfString:@"/media/gallery"];
            if (methodFound.location != NSNotFound && methodFound.length > 0) {
                [self.webView stringByEvaluatingJavaScriptFromString:@"isWifi(true)"];
            }
            
            NSLog(@"The internet is working via WIFI. %@",currentURL);
            break;
        }
        case ReachableViaWWAN: {
            NSRange methodFound = [currentURL rangeOfString:@"/media/gallery"];
            if (methodFound.location != NSNotFound && methodFound.length > 0) {
                [self.webView stringByEvaluatingJavaScriptFromString:@"isWifi(false)"];
            }
            NSLog(@"The internet is working via WWAN.%@",currentURL);
            break;
        }
    }
}


@end
