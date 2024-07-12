//
//  CHG_BorderV.h
//  ChatBird
//
//  Created by 嘉爸爸 on 2024/6/21.
//  带边框的UIView

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, CHG_BorderType) {
    CHG_BorderTypeNone     = 0,
    CHG_BorderTypeTop      = 1 << 0,
    CHG_BorderTypeLeft     = 1 << 1,
    CHG_BorderTypeRight    = 1 << 2,
    CHG_BorderTypeBottom   = 1 << 3,
};


@interface CHG_BorderV : UIView

@property (assign, nonatomic) CHG_BorderType borderType;// 边框类型
@property (assign, nonatomic) CGFloat borderWidth;
@property (strong, nonatomic) UIColor *borderColor;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) BOOL isFirstCell;
@property (assign, nonatomic) BOOL isLastCell;

@end
