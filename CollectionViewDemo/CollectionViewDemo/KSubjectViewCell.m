//
//  KSubjectViewCell.m
//  Photographer
//
//  Created by guojun on 9/1/15.
//  Copyright (c) 2015 zhaipengcheng. All rights reserved.
//

#import "KSubjectViewCell.h"
#import "UIColor+KColor.h"

@interface KSubjectViewCell()

@property (nonatomic, weak) IBOutlet UILabel *subjectLabel;

@end
@implementation KSubjectViewCell

+ (UINib *)cellNib {
    static UINib *cellNib;
    
    if (cellNib) {
        return cellNib;
    }
    
    cellNib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    return cellNib;
}

- (void)awakeFromNib {

}

- (void)highlightView:(UIView *)view{
    self.subjectLabel.textColor = UIColorFromRGB(0x1171bf);
}

- (void)unhighlightView:(UIView *)view{
    self.subjectLabel.textColor = UIColorFromRGB(0x008dff);
}

#pragma mark - Getters & Setters
- (void)setSubject:(NSString *)subject{
    _subject = subject;
    
    self.subjectLabel.text = subject;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    
    self.subjectLabel.textAlignment = textAlignment;
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    
    if (isSelected) {
        [self highlightView:self];
    } else {
        [self unhighlightView:self];
    }
}

@end
