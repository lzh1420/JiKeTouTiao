//
//  TabBarViewController.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeNewsViewController.h"
#import "ScienceViewController.h"
#import "VideoViewController.h"
#import "CrowdfundingViewController.h"
#import "SettingViewController.h"
#import "JiKeNavigationViewController.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpControllers];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
}

/*
 controller  子视图控制器的类名
 title   item要显示的标题文字
 image   item显示的图标
 selectedimage 选中图标
 
 */
-(void)setUpOneChildController:(UIViewController *)controller Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedimage{
    
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //    设置内边距
//    CGFloat offset = 6.0;
//    controller.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    
    [self addChildViewController:controller];
    
    
    
}

-(void)setUpControllers{
    
    [self setUpOneChildController:[[JiKeNavigationViewController alloc]initWithRootViewController:[[HomeNewsViewController alloc]init]] Title:@"头条" Image:@"toutiao_1" SelectedImage:@"toutiao_2"];
    
    [self setUpOneChildController:[[JiKeNavigationViewController alloc]initWithRootViewController:[[ScienceViewController alloc]init]] Title:@"科技" Image:@"keji_1" SelectedImage:@"keji_2"];
    
    [self setUpOneChildController:[[JiKeNavigationViewController alloc]initWithRootViewController:[[VideoViewController alloc]init]] Title:@"视频" Image:@"shipin_1" SelectedImage:@"shipin_2"];
    
    [self setUpOneChildController:[[JiKeNavigationViewController alloc]initWithRootViewController:[[CrowdfundingViewController alloc]init]] Title:@"众筹" Image:@"zhongchou_1" SelectedImage:@"zhongchou_2"];
    [self setUpOneChildController:[[JiKeNavigationViewController alloc]initWithRootViewController:[[SettingViewController alloc]init]] Title:@"设置" Image:@"shezhi_1" SelectedImage:@"shezhi_2"];
    
    
}





@end
