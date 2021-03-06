//
//  UITextView+XQQExtension.m
//  XQQChatProj
//
//  Created by XQQ on 2016/11/25.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "UITextView+XQQExtension.h"

@implementation UITextView (XQQExtension)

- (void)insertAttributedText:(NSAttributedString *)text{
    [self insertAttributedText:text settingBlock:nil];
}
- (void)insertAttributedText:(NSAttributedString *)text
                settingBlock:(void (^)(NSMutableAttributedString *))settingBlock{
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    // 拼接之前的文字（图片和普通文字）
    [attributedText appendAttributedString:self.attributedText];
    // 拼接其他文字
    NSUInteger loc = self.selectedRange.location;
    //    [attributedText insertAttributedString:text atIndex:loc];
    [attributedText replaceCharactersInRange:self.selectedRange withAttributedString:text];
    // 调用外面传进来的代码
    if (settingBlock) {
        settingBlock(attributedText);
    }
    self.attributedText = attributedText;
    // 移除光标到表情的后面
    self.selectedRange = NSMakeRange(loc + 1, 0);
}
@end
