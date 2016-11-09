//
//  HomeNewsModel.h
//  JiKeTouTiao
//
//  Created by 嚼华先森 on 2016/11/9.
//  Copyright © 2016年 嚼华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeNewsModel : NSObject

@property (nonatomic,strong) NSString * title;
// 文本摘要
@property (nonatomic,copy) NSString * content168;

// 来源
@property (nonatomic,copy) NSString * sourcename;

// 配图
@property (nonatomic,copy) NSString * imglink;

@property (nonatomic,strong) NSString * url;



-(instancetype)initWithDict:(NSDictionary *)dict;

+(NSMutableArray *)processingDict:(NSDictionary *)dict;


@end
