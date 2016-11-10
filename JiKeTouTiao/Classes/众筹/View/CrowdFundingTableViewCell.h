//
//  CrowdFundingTableViewCell.h
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/10.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrowdfundingModel.h"
#import <UIImageView+WebCache.h>

@interface CrowdFundingTableViewCell : UITableViewCell

// 配图
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
// 众筹来源
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
// 标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) CrowdfundingModel * model;


@end
