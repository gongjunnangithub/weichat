//
//  NetRequest.m
//  weichat
//
//  Created by 巩俊楠 on 16/4/25.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "NetRequest.h"
#import "MessageModel.h"
@implementation NetRequest
+ (instancetype)shareRequest {
    id static _distance ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration] ;
        _distance = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    });
    return _distance ;
}

+(void)getMsgWithPargma:(MessageModel *)msg SuccessBlock:(void(^)(NSDictionary *responses))success FailBlock:(void(^)(NSError *error))failBlock {
    AFURLSessionManager *manger = [self shareRequest] ;
    NSURLRequest *request = msg.request ;
    

}
//+(void)getMsgWithPargma:(NSDictionary *)dict SuccessBlock:(void(^)(NSDictionary *msg))Success FailBlock:(void(^)(NSError *error))failBlock {
//    AFURLSessionManager *sessionManager = [self shareRequest] ;
//    [sessionManager dataTaskWithRequest:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        
//        failBlock(error);
//    }];
//
//}
@end
