//
//  JiKeNavigationViewController.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "JiKeNavigationViewController.h"
#import "PrefixHeader.pch"

@interface JiKeNavigationViewController ()

@end

@implementation JiKeNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance]setBarTintColor:RLColor(67, 74, 77)];
     [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
  
    
    
}

-(void)rightBtnAction:(UINavigationItem *)sender{
    
    
}



@end
