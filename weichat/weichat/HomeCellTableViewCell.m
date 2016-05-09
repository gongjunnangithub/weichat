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
    self.dateLabel.textColor = [UIColor lightTextColor] ;
    self.dateLabel.font = [UIFont systemFontOfSize:Font12] ;
    [self.contentView addSubview:self.dateLabel];
    return self ;
}

- (void)layoutSubviews {
    [super layoutSubviews] ;
    self.dateLabel.frame = CGRectMake(20, 5,KScreenWidth - 20 - 20  , 14);
}
@end
