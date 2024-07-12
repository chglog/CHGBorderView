//
//  TableViewCell.m
//  CHGBorderView
//
//  Created by 嘉爸爸 on 2024/7/12.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _bgView.borderWidth = 0.5;
    _bgView.borderColor = [UIColor redColor];
    _bgView.cornerRadius = 12;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
