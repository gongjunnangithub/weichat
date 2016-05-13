//
//  OthersCell.m
//  weichat
//
//  Created by LeiShan on 16/5/13.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "OthersCell.h"
@interface OthersCell()
@property(nonatomic,strong)UIImageView *iconView ;
@property(nonatomic,strong)UIView *backView ;
@property(nonatomic,strong)UILabel *contentLabel ;
@property(nonatomic,strong)UIImageView *backImageView ;
@end
@implementation OthersCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(5);
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.height.width.equalTo(@40);
        }];
        
        self.backView = [[UIView alloc] init];
        [self.contentView addSubview:self.backView];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconView.right).offset(5);
            make.top.equalTo(self.iconView.top);
            make.right.equalTo(self.contentView.right).offset(-55);
            make.bottom.equalTo(self.contentView.bottom);
        }];
        
        self.backImageView = [[UIImageView alloc] init];
        self.backImageView.image = [UIImage imageNamed:@"ReceiverAppNodeBkg"];
        [self.backView addSubview:self.backImageView];
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leftMargin.equalTo(self.backView).offset(0);
            make.rightMargin.equalTo(self.backView).offset(0);
            make.topMargin.equalTo(self.backView).offset(0);
            make.bottomMargin.equalTo(self.backView).offset(9);
          
        }];
        self.contentLabel = [[UILabel alloc] init] ;
        [self.backView addSubview:self.contentLabel];
        self.contentLabel.numberOfLines = 0 ;
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.equalTo(self.backView).offset(10);
            make.rightMargin.equalTo(self.backView).offset(8);
            make.topMargin.equalTo(self.backView).offset(0);
            make.bottomMargin.equalTo(self.backView).offset(0);
        }];
         }
    return self;
}
- (void)setMsgModel:(MsgMOdel *)msgModel{
    _msgModel = msgModel ;
    self.contentLabel.text = msgModel.content ;
}
- (void)setTalkModel:(TalkModel *)talkModel {
    _talkModel = talkModel ;
    self.iconView.image = [UIImage imageNamed:talkModel.imageName];

}
@end
