//
//  HomeNewsTableViewCell.h
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeNewsModel.h"
#import <UIImageView+WebCache.h>

@interface HomeNewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *ttitleLabel;
// 内容摘要
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;
// 来源
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (nonatomic,strong) HomeNewsModel * model;


@end
