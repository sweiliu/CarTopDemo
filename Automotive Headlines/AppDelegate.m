//
//  AppDelegate.m
//  Automotive Headlines
//
//  Created by apple on 12/28/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "AppDelegate.h"
#import "InfomationVIew.h"
#import "ChoiceView.h"
#import "ChooseCarView.h"
#import "MineViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window= [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //资讯页面
    InfomationVIew *infomationVC =[[InfomationVIew alloc]init];
    UIImage *infomationIMG = [UIImage imageNamed:@"zixun"];
    UIImage *infomationSelectedIMG = [UIImage imageNamed:@"zixun2"];
    UITabBarItem *infomationBI = [[UITabBarItem alloc]initWithTitle:@"资讯" image:infomationIMG selectedImage:infomationSelectedIMG];
  //  infomationBI.imageInsets = UIEdgeInsetsMake(0, -5, 25, 20);
    infomationVC.tabBarItem = infomationBI;
    UINavigationController *infomationNV = [[UINavigationController alloc]initWithRootViewController:infomationVC];
    
    
    //精选页面
    UIImage *choiceIMG = [UIImage imageNamed:@"jingxuan"];
    UIImage *choiceSelectedIMG = [UIImage imageNamed:@"jingxuan2"];
    ChoiceView *choiceVC = [[ChoiceView alloc]init];
    UITabBarItem *choiceBI =[[UITabBarItem alloc]initWithTitle:@"精选" image:choiceIMG selectedImage:choiceSelectedIMG];
    choiceVC.tabBarItem = choiceBI;
    UINavigationController *choiceNV = [[UINavigationController alloc]initWithRootViewController:choiceVC];
    
    
    //选车页面
    UIImage *chooseCarIMG = [UIImage imageNamed:@"xuanche"];
    UIImage *chooseCarSelectedIMG = [UIImage imageNamed:@"xuanche2"];
    ChooseCarView *chooseCarVC = [[ChooseCarView alloc]init];
    UITabBarItem *chooseCarBI =[[UITabBarItem alloc]initWithTitle:@"选车" image:chooseCarIMG selectedImage:chooseCarSelectedIMG];
    chooseCarVC.tabBarItem = chooseCarBI;
    UINavigationController *chooseCarNV = [[UINavigationController alloc]initWithRootViewController:chooseCarVC];
    

    //我的页面
    UIImage *mineIMG = [UIImage imageNamed:@"wode"];
    UIImage *mineCeletedIMG = [UIImage imageNamed:@"wode2"];
    UITabBarItem *mineBI = [[UITabBarItem alloc]initWithTitle:@"我的" image:mineIMG selectedImage:mineCeletedIMG];
    MineViewController *mineVC = [[MineViewController alloc]init];
    mineVC.tabBarItem = mineBI;
    UINavigationController *mineNV = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    
    UITabBarController *automotiveHeadlings = [[UITabBarController alloc]init];
    automotiveHeadlings.viewControllers = @[infomationNV, choiceNV, chooseCarNV, mineNV];
    self.window.rootViewController  = automotiveHeadlings;
    [self.window makeKeyAndVisible];
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
