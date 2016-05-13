//
//  AppUnit.m
//  weichat
//
//  Created by LeiShan on 16/4/22.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "AppUnit.h"

@implementation AppUnit
+(NSArray *)getUserRandomMsg{
    
    

    return nil ;
}
+(CGFloat)heightOfLableWithContent:(NSString *)content width:(CGFloat)width andFont:(UIFont*)font {

    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize lastSize = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return lastSize.height ;
}
@end
