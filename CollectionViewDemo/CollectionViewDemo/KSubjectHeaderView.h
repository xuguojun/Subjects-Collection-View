//
//  KSubjectHeaderView.h
//  Photographer
//
//  Created by guojun on 9/2/15.
//  Copyright (c) 2015 zhaipengcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSubjectHeaderView : UICollectionReusableView

@property (nonatomic, copy) NSString *title;

+ (UINib *)cellNib;

@end
