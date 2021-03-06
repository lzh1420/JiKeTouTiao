//
//  CrowdfundingViewController.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "CrowdfundingViewController.h"
#import <MJRefresh.h>
#import "AFNetWorkRequest.h"
#import <AFNetworking.h>
#import "PrefixHeader.pch"
#import "CrowdFundingTableViewCell.h"
#import "CrowdfundingModel.h"
#import "CrowdfundingNewsWebViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface CrowdfundingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray<CrowdfundingModel *> * dataSource;
@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation CrowdfundingViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = ScreenHeight/3.f;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
        
        [_tableView registerNib:[UINib nibWithNibName:@"CrowdFundingTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellIdentifier];
        
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"极客众筹";
    [self netWorkRequest];
    [self.view addSubview:self.tableView];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAction:)];
    
    
#pragma mark 上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self.tableView .mj_footer beginRefreshing];
        self.currentPage += 1;
        [self loadMoreData:self.currentPage];
        
    }];
    
    
#pragma mark 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTopMoreData)];
    [self.tableView.mj_header beginRefreshing];

}

-(void)rightBtnAction:(UIBarButtonItem *)sender{

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTopMoreData)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)netWorkRequest{
    
    NSString *CrowdfundString = [NSString stringWithFormat:@"http://api.geeknews.app887.com/api/Articles.action?npc=%ld&opc=20&type=%@",self.currentPage,@"众筹"];
    [AFNetWorkRequest getRequestWithUrl:CrowdfundString result:^(id result) {
       
//        RLLog(@"**********%@************ ",result);
        self.dataSource = [CrowdfundingModel processingDict:result];
        [self.tableView reloadData];
    }];
    

}

#pragma mark 上拉加载实现方法

-(void)loadMoreData:(NSInteger )page{
    
     NSString *CrowdfundString = [NSString stringWithFormat:@"http://api.geeknews.app887.com/api/Articles.action?npc=%ld&opc=20&type=%@",self.currentPage,@"众筹"];
    [AFNetWorkRequest getRequestWithUrl:CrowdfundString result:^(id result) {
                RLLog(@"**********%@************ ",result);
#pragma mark 上拉加载更多核心代码
        [self.dataSource addObjectsFromArray:[CrowdfundingModel processingDict:result]];
        self.currentPage ++;
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    }];
    
}

#pragma mark 下拉刷新实现方法
-(void)loadTopMoreData{
    
    self.currentPage = 1;
   NSString *CrowdfundString = [NSString stringWithFormat:@"http://api.geeknews.app887.com/api/Articles.action?npc=%ld&opc=20&type=%@",self.currentPage,@"众筹"];
    [AFNetWorkRequest getRequestWithUrl:CrowdfundString result:^(id result) {
        
        [self.dataSource addObjectsFromArray:[CrowdfundingModel processingDict:result]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}




#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell isKindOfClass:[CrowdFundingTableViewCell class]]) {
        CrowdfundingModel *model = self.dataSource[indexPath.row];
        CrowdFundingTableViewCell *c = (CrowdFundingTableViewCell *)cell;
        c.model = model;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
    
}

#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CrowdfundingNewsWebViewController *newsWebView = [CrowdfundingNewsWebViewController new];
    newsWebView.url = self.dataSource[indexPath.row].url;
    newsWebView.title = self.dataSource[indexPath.row].title;
    [self.navigationController pushViewController:newsWebView animated:YES];
    
}



@end
