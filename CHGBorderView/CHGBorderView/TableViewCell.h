//
//  TableViewCell.h
//  CHGBorderView
//
//  Created by 嘉爸爸 on 2024/7/12.
//

#import <UIKit/UIKit.h>
#import "CHG_BorderV.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CHG_BorderV *bgView;

@end

NS_ASSUME_NONNULL_END
