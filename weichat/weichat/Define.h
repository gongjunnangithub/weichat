//
//  Define.h
//  weichat
//
//  Created by LeiShan on 16/4/21.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#ifndef Define_h
#define Define_h
#import <Masonry.h>

#endif /* Define_h */
#define KScreenBounds [UIScreen mainScreen].bounds
#define KScreenSize [UIScreen mainScreen].bounds.size
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHight [UIScreen mainScreen].bounds.size.height
#define KTopHeight 64
#define KBottomBarHeight 49
#define KNavBarH 44
#define KStateBarH 20

#define Font12 12 
#define Font14 14
#define Font16 16 
#define Font18 18 

#define SystenVersion        [UIDevice currentDevice].systemVersion.intValue

#pragma mark -- color 
#define TabBarTitleColor  [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1] 
#define KLog(xx) NSLog(@"%@",xx)