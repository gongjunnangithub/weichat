//
//  MessageModel.m
//  weichat
//
//  Created by 巩俊楠 on 16/4/25.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
+(instancetype)firstModel {
    MessageModel *model = [[MessageModel alloc] init] ;
    model.request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baidu.com"]] ;
    model.parama = [NSDictionary dictionary] ;
    return model ;

}
@end
