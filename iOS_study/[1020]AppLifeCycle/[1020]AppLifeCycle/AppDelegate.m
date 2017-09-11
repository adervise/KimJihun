//
//  AppDelegate.m
//  [1020]AppLifeCycle
//
//  Created by celeste on 2016. 10. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    ViewController *rootViewController = [[ViewController alloc] init] ;
//    rootViewController.view.backgroundColor = [UIColor lightGrayColor];
    
    
    // 로그인 여부를 파악하여 어떤 스토리보드 화면을 보여줄지에 대한 부분.
    UIStoryboard *firstStoryBoard = nil;
    UIViewController *rootViewController = nil;
    BOOL isUserLogined = NO;
    
    if (isUserLogined) {
        firstStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    } else {
        firstStoryBoard = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    }
    
    rootViewController = [firstStoryBoard instantiateInitialViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];

    NSLog(@"willFinishLaunchingWithOptions");
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    
    [[UILabel appearance] setBackgroundColor:[UIColor yellowColor]];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        NSLog(@"applicationDidEnterBackground");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        NSLog(@"applicationDidEnterBackground");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}


@end
