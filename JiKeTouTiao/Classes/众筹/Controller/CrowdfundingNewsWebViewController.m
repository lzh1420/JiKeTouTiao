//
//  CrowdfundingNewsWebViewController.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/10.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "CrowdfundingNewsWebViewController.h"

@interface CrowdfundingNewsWebViewController ()

@end

@implementation CrowdfundingNewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    web.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:web];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [web loadRequest:request];
}




@end
