//
//  HomeNewsModel.m
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import "HomeNewsModel.h"

@implementation HomeNewsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(NSMutableArray *)processingDict:(NSDictionary *)dict{
    
    NSMutableArray *resultArray = [NSMutableArray array];
    NSDictionary *dictionary = dict[@"root"];
    NSArray *array = dictionary[@"list"];
    for (NSDictionary *dic in array) {
        HomeNewsModel *model = [[HomeNewsModel alloc]initWithDict:dic];
        [resultArray addObject:model];
    }
    return resultArray;

}

@end
