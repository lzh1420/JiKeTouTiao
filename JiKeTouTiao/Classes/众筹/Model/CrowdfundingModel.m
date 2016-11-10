//
//  CrowdfundingModel.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/10.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "CrowdfundingModel.h"

@implementation CrowdfundingModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(NSMutableArray *)processingDict:(NSDictionary *)dict{
    
    NSMutableArray *crowdResultArray = [NSMutableArray array];
    NSDictionary *dictionary = dict[@"root"];
    NSArray *array = dictionary[@"list"];
    for (NSDictionary *dic in array) {
        CrowdfundingModel *model = [[CrowdfundingModel alloc]initWithDict:dic];
        [crowdResultArray addObject:model];
    }
    return crowdResultArray;
}
@end
