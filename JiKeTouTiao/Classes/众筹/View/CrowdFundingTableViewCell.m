//
//  CrowdFundingTableViewCell.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/10.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "CrowdFundingTableViewCell.h"

@implementation CrowdFundingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)setModel:(CrowdfundingModel *)model{
    
    self.sourceLabel.text = model.sourcename;
    self.titleLabel.text = model.title;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.imglink]]];
    
}



@end
