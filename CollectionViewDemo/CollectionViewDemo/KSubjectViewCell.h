//
//  KSubjectViewCell.h
//  Photographer
//
//  Created by guojun on 9/1/15.
//  Copyright (c) 2015 zhaipengcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSubjectViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *subject;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) BOOL isSelected;

+ (UINib *)cellNib;

@end
