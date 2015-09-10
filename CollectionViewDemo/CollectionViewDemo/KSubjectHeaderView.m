//
//  KSubjectHeaderView.m
//  Photographer
//
//  Created by guojun on 9/2/15.
//  Copyright (c) 2015 zhaipengcheng. All rights reserved.
//

#import "KSubjectHeaderView.h"
#import "UIColor+KColor.h"

@interface KSubjectHeaderView()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end
@implementation KSubjectHeaderView

+ (UINib *)cellNib {
    static UINib *cellNib;
    
    if (cellNib) {
        return cellNib;
    }
    
    cellNib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    return cellNib;
}

- (void)awakeFromNib {

    self.titleLabel.textColor = UIColorFromRGB(0x8a9099);
}

#pragma mark - Getters & Setters
- (void)setTitle:(NSString *)title{
    if (_title != title) {
        _title = title;
        
        self.titleLabel.text = title;
    }
}
@end
