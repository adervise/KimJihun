//
//  AppDelegate.m
//  CarIsYou
//
//  Created by clmns on 2017. 3. 15..
//  Copyright © 2017년 clmns. All rights reserved.
//

#import "AppDelegate.h"
#import "MediaViewController.h"
#import <KeychainItemWrapper.h>
#import <AFNetworking.h>


#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@import UserNotifications;
#endif

@import Firebase;
@import FirebaseInstanceID;
@import FirebaseMessaging;

// Implement UNUserNotificationCenterDelegate to receive display notification via APNS for devices
// running iOS 10 and above. Implement FIRMessagingDelegate to receive data message via FCM for
// devices running iOS 10 and above.
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@interface AppDelegate () <UNUserNotificationCenterDelegate, FIRMessagingDelegate>



@end
#endif

// Copied from Apple's header in case it is missing in some cases (e.g. pre-Xcode 8 builds).
#ifndef NSFoundationVersionNumber_iOS_9_x_Max
#define NSFoundationVersionNumber_iOS_9_x_Max 1299
#endif
@implementation AppDelegate

NSString *const kGCMMessageIDKey = @"gcm.message_id";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 20)];
    self.statusView.backgroundColor = [UIColor whiteColor];
    [self.window.rootViewController.view addSubview:self.statusView];

    // Custom User Agent 등록하기
    [AppDelegate registerCustomAgent];

// Register for remote notifications. This shows a permission dialog on first run, to show the dialog at a more appropriate time move this registration accordingly.
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        
        UIRemoteNotificationType allNotificationTypes = (UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge);
        [application registerForRemoteNotificationTypes:allNotificationTypes];

#pragma clang diagnostic pop
    
    } else {
        // iOS 8 or later
        // [START register_for_notifications]
    
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
            UIUserNotificationType allNotificationTypes =
            (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

        } else {
            // iOS 10 or later
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
            // For iOS 10 display notification (sent via APNS)
            [UNUserNotificationCenter currentNotificationCenter].delegate = self;
            UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
            [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions
                                                                                completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                                                                                        NSLog(@"granted: %d ,authOptions: %ld",granted, authOptions);
                                                                                }];
            
            // For iOS 10 data message (sent via FCM)
            [FIRMessaging messaging].remoteMessageDelegate = self;
#endif
        }
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        // [END register_for_notifications]
    }
    
    // [START configure_firebase]
    [FIRApp configure];
    // [END configure_firebase]
    
    // [START add_token_refresh_observer]
    // Add observer for InstanceID token refresh callback.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tokenRefreshNotification:)
                                                 name:kFIRInstanceIDTokenRefreshNotification
                                               object:nil];
    // [END add_token_refresh_observer]
    
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"🏓🏓🏓 Token : %@ ", refreshedToken);
    return YES;
}


//- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
//    
//    if ((notificationSettings.types & 1) == UIUserNotificationTypeNone) {
//        NSLog(@"user selected NO");
//    }
//    else {
//        NSLog(@"user selected YES");
//    }
//}


// [START receive_message]
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    // Print full message.
    NSLog(@"didReceiveRemoteNotification: %@", userInfo);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification

    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"didReceiveRemoteNotification\t:%@", userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
}

// [END receive_message]

// [START ios_10_message_handling]
// Receive displayed notifications for iOS 10 devices.
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
// Handle incoming notification messages while app is in the foreground.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    // Print message ID.
    NSDictionary *userInfo = notification.request.content.userInfo;
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"willPresentNotification:\t%@", userInfo);
    
    // Change this to your preferred presentation option
    completionHandler(UNNotificationPresentationOptionNone);
}

// Handle notification messages after display notification is tapped by the user.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"userInfo:%@", userInfo);
    
    completionHandler();
}

#endif
// [END ios_10_message_handling]

// [START ios_10_data_message_handling]
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
// Receive data message on iOS 10 devices while app is in the foreground.
- (void)applicationReceivedRemoteMessage:(FIRMessagingRemoteMessage *)remoteMessage {
    // Print full message
    NSLog(@"applicationReceivedRemoteMessage\t:%@", remoteMessage.appData);
}
#endif
// [END ios_10_data_message_handling]

// [START refresh_token]
- (void)tokenRefreshNotification:(NSNotification *)notification {
    // Note that this callback will be fired everytime a new token is generated, including the first
    // time. So if you need to retrieve the token as soon as it is available this is where that
    // should be done.
    
    // 토큰 유무 변경에 따라서 키체인 저장 & 삭제 후 저장
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"😘😘 InstanceID token: %@", refreshedToken);
    
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];

    if ([wrapper objectForKey:(__bridge id)(kSecValueData)] == nil) {
        [self saveTokenInKeyChain];
//        [self sendToken];
    } else if ([wrapper objectForKey:(__bridge id)(kSecValueData)] != refreshedToken) {
        [self removeToken];
        [self saveTokenInKeyChain];
//        [self sendToken];
    }
    // Connect to FCM since connection may have failed when attempted before having a token.
    [self connectToFcm];
}
// [END refresh_token]

// [START connect_to_fcm]
- (void)connectToFcm {
    // Won't connect since there is no token
    if (![[FIRInstanceID instanceID] token]) {
        return;
    }
    
    // Disconnect previous FCM connection if it exists.
    [[FIRMessaging messaging] disconnect];
    
    [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Unable to connect to FCM. %@", error);
        } else {
            NSLog(@"Connected to FCM.");
        }
    }];
}
// [END connect_to_fcm]

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Unable to register for remote notifications: %@", error);
    
}

// This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
// If swizzling is disabled then this function must be implemented so that the APNs token can be paired to the InstanceID token.
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *newToken = [[[NSString stringWithFormat:@"%@",deviceToken]
                           stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]]
                          stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSLog(@"DeviceToken: %@", newToken );
    NSLog(@"APNs token retrieved: %@", deviceToken);
    // With swizzling disabled you must set the APNs token here.
    // [[FIRInstanceID instanceID] setAPNSToken:deviceToken type:FIRInstanceIDAPNSTokenTypeSandbox];
}

// [START connect_on_active]
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");
    
    UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions
                                                                        completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                                                            NSLog(@"granted: %d ,authOptions: %ld",granted, authOptions);
                                                                        }];
    
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"Noti Setting : %@",settings);
    }];
    [application registerForRemoteNotifications];
    [self connectToFcm];

    // 해당 컨트롤러 이름을 찾아서 갤러리인 경우에 화면 돌려주기
    NSString *getClassName = [NSString stringWithFormat:@"%@", [self getCurrentViewController]];
    if ([getClassName containsString:@"MediaViewController"]) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
        
        
    }
}
// [END connect_on_active]

// [START disconnect_from_fcm]
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[FIRMessaging messaging] disconnect];
    NSLog(@"Disconnected from FCM");
}
// [END disconnect_from_fcm]

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"applicationWillEnterForeground");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
}

// UserAgent 변경하기
+ (void)registerCustomAgent {
    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *userAgent = [webview stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *customAgent = [NSString stringWithFormat:@"%@/%@", @"CIY", @"v1.0.0"];
    NSDictionary *dict = @{@"UserAgent" : [NSString stringWithFormat:@"%@ %@",userAgent, customAgent]};
    [[NSUserDefaults standardUserDefaults] registerDefaults:dict];
}

- (void)saveTokenInKeyChain {

    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    NSString *token = [[FIRInstanceID instanceID] token];
    [wrapper setObject:token forKey:(__bridge id)(kSecValueData)];
    NSLog(@"😘😘 new token : %@",[wrapper objectForKey:(__bridge id)(kSecValueData)]);
}

- (void)removeToken {
    
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"token" accessGroup:nil];
    NSLog(@"😘 remove : %@",[wrapper objectForKey:(__bridge id)(kSecValueData)]);
    [wrapper resetKeychainItem];
}


// 마지막으로 본 컨트롤러 객체 얻어낸 후 갤러리 일 경우 화면 돌리기
- (id)getCurrentViewController {
    
    id WindowRootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    id currentViewController = [self findTopViewController:WindowRootVC];
    return currentViewController;
}

- (id)findTopViewController:(id)inController {
    
    if ([inController isKindOfClass:[UITabBarController class]]) {
        return [self findTopViewController:[inController selectedViewController]];
    } else if ([inController isKindOfClass:[UINavigationController class]]) {
        return [self findTopViewController:[inController visibleViewController]];
    } else if ([inController isKindOfClass:[UIViewController class]]) {
        return inController;
    } else {
        NSLog(@"Unhandled ViewController class : %@",inController);
        return nil;
    }
}


- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    if ([navigationController.viewControllers.lastObject isKindOfClass:[MediaViewController class]]) {
        self.statusView.hidden = YES;
        return UIInterfaceOrientationMaskLandscape;
    } else {
        self.statusView.hidden = NO;
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
