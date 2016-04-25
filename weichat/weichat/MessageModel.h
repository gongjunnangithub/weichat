//
//  MessageModel.h
//  weichat
//
//  Created by 巩俊楠 on 16/4/25.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject
@property(nonatomic,strong)NSURLRequest *request ;
@property(nonatomic,strong)NSDictionary *parama ;
+(instancetype)firstModel ;
@end
