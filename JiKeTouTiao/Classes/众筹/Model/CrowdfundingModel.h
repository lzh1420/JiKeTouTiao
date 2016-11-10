//
//  CrowdfundingModel.h
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/10.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrowdfundingModel : NSObject

// 来源
@property (nonatomic,strong) NSString * sourcename;
// 标题
@property (nonatomic,strong) NSString * title;
// 配图
@property (nonatomic,strong) NSString * imglink;

@property (nonatomic,strong) NSString * url;



-(instancetype)initWithDict:(NSDictionary *)dict;
+(NSMutableArray *)processingDict:(NSDictionary *)dict;
@end
