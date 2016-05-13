//
//  AppUnit.h
//  weichat
//
//  Created by LeiShan on 16/4/22.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUnit : NSObject
+(NSArray *)getUserRandomMsg ;
+(CGFloat)heightOfLableWithContent:(NSString *)content width:(CGFloat)width andFont:(UIFont* )font ;
@end
