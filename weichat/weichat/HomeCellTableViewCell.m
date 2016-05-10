//
//  HomeCellTableViewCell.m
//  weichat
//
//  Created by LeiShan on 16/4/22.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "HomeCellTableViewCell.h"
#import "Define.h"
@interface HomeCellTableViewCell()
@property(nonatomic,strong)UIImageView *iconView ;
@property(nonatomic,strong)UILabel *nameLabel ;
@property(nonatomic,strong)UILabel *descriptionLable ;
@end
@implementation HomeCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ;
    self.dateLabel = [[UILabel alloc] init] ;
    self.dateLabel.textAlignment = NSTextAlignmentRight ;
    self.dateLabel.textColor = [UIColor darkGrayColor] ;
    self.dateLabel.frame = CGRectMake(20, 5,KScreenWidth - 20 - 20  , 14);

    self.dateLabel.font = [UIFont systemFontOfSize:Font12] ;
    [self.contentView addSubview:self.dateLabel];
    
    self.iconView = [[UIImageView alloc] init] ;
    self.iconView.frame = CGRectMake(5, 5, 60, 60);
    [self.contentView addSubview:self.iconView] ;
    
    self.nameLabel = [[UILabel alloc] init] ;
    self.nameLabel.textColor = [UIColor redColor] ;
    self.nameLabel.font = [UIFont systemFontOfSize:15] ;
    self.nameLabel.frame = CGRectMake(75, 8, 150, 20);
    [self.contentView addSubview:self.nameLabel] ;
    
    self.descriptionLable = [[UILabel alloc] init] ;
    self.descriptionLable.frame = CGRectMake(75, 40, 200, 20);
    [self.contentView addSubview:self.descriptionLable] ;
    
    
    return self ;
}

- (void)setTalkMidel:(TalkModel *)talkMidel {
    _talkMidel = talkMidel ;
    self.dateLabel.text = talkMidel.lastDate ;
    self.iconView.image = [UIImage imageNamed:talkMidel.imageName];
    self.nameLabel.text = talkMidel.name ;
    self.descriptionLable.text = talkMidel.content ;

}
- (void)layoutSubviews {
    [super layoutSubviews] ;
}
@end
