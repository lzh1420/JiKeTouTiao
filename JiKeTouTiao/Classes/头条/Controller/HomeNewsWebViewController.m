//
//  HomeNewsWebViewController.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "HomeNewsWebViewController.h"

@interface HomeNewsWebViewController ()


@end

@implementation HomeNewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    web.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:web];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [web loadRequest:request];
    
}



@end
