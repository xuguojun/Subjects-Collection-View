//
//  KSubjectView.h
//  Photographer
//
//  Created by guojun on 9/1/15.
//  Copyright (c) 2015 zhaipengcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSubjectView;
@protocol KSubjectViewDelegate <NSObject>

@required
- (void)subjectCollectionView:(KSubjectView *)view didSelectCellAtIndex:(NSIndexPath *)indexPath;

@end
@interface KSubjectView : UIView

@property (nonatomic, strong) NSArray *subjects;
@property (nonatomic, weak) IBOutlet id<KSubjectViewDelegate> delegate;

@end
