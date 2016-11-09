//
//  HomeNewsViewController.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "HomeNewsViewController.h"
#import "HomeNewsTableViewCell.h"
#import "HomeNewsModel.h"
#import "AFNetWorkRequest.h"
#import <AFNetworking.h>
#import <MJRefresh.h>
#import "PrefixHeader.pch"
#import "HomeNewsWebViewController.h"

#define CellIdentifier @"cellIdentifier"

@interface HomeNewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray<HomeNewsModel *> * dataSource;
@property (nonatomic,assign) NSInteger  currentPage;


@end

@implementation HomeNewsViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = ScreenHeight/1.4;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        [_tableView registerNib:[UINib nibWithNibName:@"HomeNewsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdentifier];
        
        
    }
    return _tableView;
}

-(NSMutableArray<HomeNewsModel *> *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"极客头条";
    [self.view addSubview:self.tableView];
    [self netWorkRequest];
    
#pragma mark 去除导航栏返回字体
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    
#pragma mark 上拉加载更多
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self.tableView .mj_footer beginRefreshing];
        self.currentPage += 1;
        [self loadMoreData:self.currentPage forTable:self.tableView];
        
    }];
    
}

#pragma mark --- 网络请求
-(void)netWorkRequest{
    
//    NSString *urlString = [NSString stringWithFormat:@"http://api.geeknews.app887.com/api/Articles.action?opc=10&npc=0&type=%@",@"头条"];
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.geeknews.app887.com/api/Articles.action?opc=10&npc=%ld&type=%@",self.currentPage,@"头条"];
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
       
        self.dataSource = [HomeNewsModel processingDict:result];
        [self.tableView reloadData];
        
    }];
}

#pragma mark 实现上拉加载更多方法
-(void)loadMoreData:(NSInteger )page forTable:(UITableView *)tableView{
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.geeknews.app887.com/api/Articles.action?opc=10&npc=%ld&type=%@",self.currentPage,@"头条"];
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
        
        self.dataSource = [HomeNewsModel processingDict:result];
        [tableView.mj_footer endRefreshing];
        self.currentPage ++;
        [self.tableView reloadData];
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell isKindOfClass:[HomeNewsTableViewCell class]]) {
        HomeNewsTableViewCell *c = (HomeNewsTableViewCell *)cell;
        HomeNewsModel *homeNewsModel = self.dataSource[indexPath.row];
        c.model = homeNewsModel;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeNewsWebViewController *newsWebView = [HomeNewsWebViewController new];
    newsWebView.url = self.dataSource[indexPath.row].url;
//    跳转到web上面导航栏title显示标题
    newsWebView.title = self.dataSource[indexPath.row].title;
    [self.navigationController pushViewController:newsWebView animated:YES];
    
    
}



@end
