//
//  AppDelegate.m
//  欢迎 热爱编程  热爱 objective-c swift iOS 的朋友一起学习进步，群号：328218600

//That's a cool car!

#import "LYCAppDelegate.h"
#import "LYCTabBarController.h"
#import "LYCBottomSliderController.h"
@interface LYCAppDelegate ()

@end

@implementation LYCAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch. 布局写的时候一开始就规划好，什么参照什么？每做一个细小的步骤都要检查清楚 不要到时候再重新布局
    
    LYCBottomSliderController *bottomSliderController = [[LYCBottomSliderController alloc] init];
    
    self.window.rootViewController = bottomSliderController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
