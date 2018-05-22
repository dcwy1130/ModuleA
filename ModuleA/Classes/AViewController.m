//
//  AViewController.m
//  MGJRouterDemo
//
//  Created by 悠然一指 on 2018/5/22.
//  Copyright © 2018年 juangua. All rights reserved.
//

#import "AViewController.h"

#import <MGJRouter/MGJRouter.h>

@interface AViewController ()

@end

@implementation AViewController

+ (void)load {
    
    [MGJRouter registerURLPattern:A_PAGE toHandler:^(NSDictionary *routerParameters) {
        id ID = [routerParameters objectForKey:@"id"];
        NSLog(@"Page ID: %@", ID);
        UINavigationController *rootVC = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *aVC = [[AViewController alloc] init];
        [rootVC pushViewController:aVC animated:YES];
        if ([routerParameters objectForKey:MGJRouterParameterCompletion]) {
            MGJRouterHandler handler = [routerParameters objectForKey:MGJRouterParameterCompletion];
            handler(routerParameters);
        }
    }];
    
    [MGJRouter registerURLPattern:A_FUNCTION_SUM toObjectHandler:^id(NSDictionary *routerParameters) {
        return @([[routerParameters objectForKey:@"a"] integerValue] + [[routerParameters objectForKey:@"b"] integerValue]);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Page A";
}

@end
