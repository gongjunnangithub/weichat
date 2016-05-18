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
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
@end
