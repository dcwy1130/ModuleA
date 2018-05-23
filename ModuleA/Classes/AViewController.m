//
//  AViewController.m
//  YRouterDemo
//
//  Created by 悠然一指 on 2018/5/22.
//  Copyright © 2018年 juangua. All rights reserved.
//

#import "AViewController.h"

#import <YRouter/YRouter.h>

@interface AViewController ()

@end

@implementation AViewController

+ (void)load {
    
    [YRouter registerURLPattern:A_PAGE toHandler:^(NSDictionary *routerParameters) {
        id ID = [routerParameters objectForKey:@"id"];
        NSLog(@"Page ID: %@", ID);
        UINavigationController *rootVC = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        UIViewController *aVC = [[AViewController alloc] init];
        [rootVC pushViewController:aVC animated:YES];
        if ([routerParameters objectForKey:YRouterParameterCompletion]) {
            YRouterHandler handler = [routerParameters objectForKey:YRouterParameterCompletion];
            handler(routerParameters);
        }
    }];
    
    [YRouter registerURLPattern:A_FUNCTION_SUM toObjectHandler:^id(NSDictionary *routerParameters) {
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
