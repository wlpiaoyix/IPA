//
//  AppDelegate.m
//  IPASourceCode
//
//  Created by wlpiaoyi on 15/10/21.
//  Copyright © 2015年 wlpiaoyi. All rights reserved.
//

#import "AppDelegate.h"
#import "PYConfigManager.h"
#import "PYEntityManager.h"
#import "PYEntitySql.h"
#import <Utile/Utile.Framework.h>
//
// EntityTest.h
//
//
//  Created by wlpiaoyi on 2015年10月15日
//  Copyright © 2015年 wlpiaoyi. All rights reserved.
//

/*
 注释
 我主要是用来测试的
 */
#import "PYEntityAsist.h"

@interface EntityTest : NSObject<PYEntity>
/*
 关键值,唯一标示
 */
@property (nonatomic) NSUInteger keyId;
/*
 不知道呀，
 这事个什么东西，
 你猜
 */
@property (nonatomic) NSInteger ivarInt;
/*
 浮点型,
 我测试一下
 */
@property (nonatomic) CGFloat ivarFloat;
@property (nonatomic, strong) NSString * ivarString;
@property (nonatomic, strong) NSDate * ivarDate;
@property (nonatomic, strong) NSData * ivarData;
@property (nonatomic) CGFloat ivarAdd;

@end
@implementation EntityTest
@end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [PYEntityAsist synEntity:@[[EntityTest class]] dataBaseName:@"test.db"];
    PYEntityManager *em = [PYEntityManager enityWithDataBaseName:@"test.db"];
    EntityTest *et = [EntityTest new];
    et.ivarString = @"你是我的小苹果";
    et.ivarInt = 2;
    et.ivarFloat = 5.77;
    et.ivarDate = [NSDate date];
    et.ivarData = [@"我的" dataUsingEncoding:NSUTF8StringEncoding];
    [em persist:et];
    et = [em find:et.keyId entityClass:et.class];
    
    et.ivarInt = 45;
    
    [em merge:et];
    
    et = [em find:et.keyId entityClass:et.class];
    [PYConfigManager setConfigValue:et Key:@"testKey"];
    et = [PYConfigManager getConfigValue:@"testKey"];
    
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
