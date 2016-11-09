//
//  HomeNewsTableViewCell.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "HomeNewsTableViewCell.h"

@implementation HomeNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

-(void)setModel:(HomeNewsModel *)model{
    self.ttitleLabel.text = model.title;
    self.contenLabel.text = model.content168;
    self.sourceLabel.text = model.sourcename;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.imglink]]];
    
    
}


@end
