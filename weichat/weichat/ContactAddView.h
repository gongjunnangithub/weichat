//
//  ContactAddView.h
//  weichat
//
//  Created by LeiShan on 16/5/6.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ContactAddView : UIView
typedef void(^btnClickBlock)(int);
@property(nonatomic,copy)btnClickBlock btnClick;
-(void)contactViewWithBtnArray:(NSArray *)btns AndActionBlock:(void(^)(int))BtnClick ;
@end
