/**
 * titanium-rounded-tab-group
 *
 * Created by Hans Knoechel
 * Copyright (c) 2021 Your Company. All rights reserved.
 */

#define USE_TI_UITAB

#import "TiRoundedtabgroupModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiUITabGroup.h"
#import "TiRoundedTabBar.h"

@implementation TiRoundedtabgroupModule

#pragma mark Internal

- (id)moduleGUID
{
  return @"599755fd-78b8-4b11-a32e-d4ca6ae67f02";
}

- (NSString *)moduleId
{
  return @"ti.roundedtabgroup";
}

@end

@interface TiUITabGroup (Rounded)

- (UITabBarController *)tabController;

@end

@implementation TiUITabGroup (Rounded)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (UITabBarController *)tabController
{
  if (controller == nil) {
    controller = [[UITabBarController alloc] init];
    [controller setValue:[TiRoundedTabBar new] forKey:@"tabBar"];
    controller.delegate = self;
    controller.moreNavigationController.delegate = self;
    [TiUtils configureController:controller withObject:self.proxy];
  }
  return controller;
}

#pragma clang diagnostic pop

@end
