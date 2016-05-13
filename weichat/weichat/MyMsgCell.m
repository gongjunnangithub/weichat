//
//  MyMsgCell.m
//  weichat
//
//  Created by LeiShan on 16/5/12.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "MyMsgCell.h"
#import <Masonry.h>
@interface MyMsgCell()
@property(nonatomic,strong)UIImageView *iconView ;
@property(nonatomic,strong)UIView *backView ;
@property(nonatomic,strong)UILabel *contentLabel ;
@property(nonatomic,strong)UIImageView *backImageView ;

@end
@implementation MyMsgCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        self.iconView = [[UIImageView alloc] init] ;
        [self.contentView addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@40);
            make.right.equalTo(self.contentView.right).offset(-5);
            make.top.equalTo(self.contentView.top).offset(5);
        }] ;
        
        self.backView = [[UIView alloc] init];
        [self.contentView addSubview:self.backView];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.iconView.left).offset(-5);
            make.top.equalTo(self.iconView.top);
            make.left.equalTo(self.contentView.left).offset(55);
            make.bottom.equalTo(self.contentView.bottom);
        }];
        
        self.backImageView = [[UIImageView alloc] init];
        self.backImageView.image = [UIImage imageNamed:@"SenderVoiceNodeBack"];
        [self.backView addSubview:self.backImageView];
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(self.backView.width);
//            make.height.equalTo(self.backView.height);
            make.leftMargin.equalTo(self.backView).offset(0);
            make.rightMargin.equalTo(self.backView).offset(0);
            make.topMargin.equalTo(self.backView).offset(0);
            make.bottomMargin.equalTo(self.backView).offset(9);
//            make.leftMargin.rightMargin.topMargin.bottomMargin.equalTo(self.backView).offset(0);
        }];
        self.contentLabel = [[UILabel alloc] init] ;
        [self.backView addSubview:self.contentLabel];
        self.contentLabel.numberOfLines = 0 ;

        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.equalTo(self.backView).offset(8);
            make.rightMargin.equalTo(self.backView).offset(10);
            make.topMargin.equalTo(self.backView).offset(0);
            make.bottomMargin.equalTo(self.backView).offset(0);
        }];
    }
    return self ;
}
- (void)setMsgModel:(MsgMOdel *)msgModel {
    _msgModel = msgModel ;
    self.iconView.image = [UIImage imageNamed:@"16.jpg"];
    self.contentLabel.text = [NSString stringWithFormat:@"%@---%@---%@",msgModel.content,msgModel.content,msgModel.content] ;

}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%@-image---%@",self.backImageView,self.backView);
    

}
@end
