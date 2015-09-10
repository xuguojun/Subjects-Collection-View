//
//  KSubjectView.m
//  Photographer
//
//  Created by guojun on 9/1/15.
//  Copyright (c) 2015 zhaipengcheng. All rights reserved.
//

#import "KSubjectView.h"
#import "KSubjectViewCell.h"
#import "KSubjectHeaderView.h"
#import "KSubject.h"

static NSString *cellID = @"cellID";
static NSString *SectionHeaderView = @"SectionHeaderView";

@interface KSubjectView()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionView *subjectCollectionView;

@end

@implementation KSubjectView

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self loadView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self loadView];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
}

#pragma mark - Private Methods
- (void)loadView{
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class])
                                                                   owner:self
                                                                 options:nil] firstObject];
    
    view.frame = self.bounds;
    [self configureView];
    
    [self addSubview:view];
}

- (void)configureView{
    [self.subjectCollectionView registerNib:[KSubjectViewCell cellNib]
                 forCellWithReuseIdentifier:cellID];
    
    [self.subjectCollectionView registerNib:[KSubjectHeaderView cellNib]
                 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                        withReuseIdentifier:SectionHeaderView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.subjects.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    KSubject *subject = self.subjects[section];
    return subject.keywords.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KSubjectViewCell *cell = (KSubjectViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellID
                                                                                           forIndexPath:indexPath];
    
    KSubject *subject = self.subjects[indexPath.section];
    cell.subject = (NSString *)subject.keywords[indexPath.row];
    
    if (indexPath.row % 4 == 0) {
        cell.textAlignment = NSTextAlignmentLeft;
    }
    
    if (indexPath.row % 4 == 1 || indexPath.row % 4 == 2) {
        cell.textAlignment = NSTextAlignmentCenter;
    }
    
    if (indexPath.row % 4 == 3) {
        cell.textAlignment = NSTextAlignmentRight;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    KSubjectViewCell *cell = (KSubjectViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isSelected = YES;
    
    if ([self.delegate respondsToSelector:@selector(subjectCollectionView:didSelectCellAtIndex:)]) {
        [self.delegate subjectCollectionView:self didSelectCellAtIndex:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    KSubjectViewCell *cell = (KSubjectViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.isSelected = NO;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *resuableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        
        KSubjectHeaderView *headerView = (KSubjectHeaderView *)
        [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                           withReuseIdentifier:SectionHeaderView
                                                  forIndexPath:indexPath];

        KSubject *subject = self.subjects[indexPath.section];;
        headerView.title = subject.title;
        
        resuableView = headerView;
    }
    
    return resuableView;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize selfSize = self.bounds.size;
    CGFloat width = selfSize.width / 4;
    CGFloat height = 34.0f;
    
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
}

- (void)setSubjects:(NSArray *)subjects{
    _subjects = subjects;
    [self.subjectCollectionView reloadData];
}

@end
