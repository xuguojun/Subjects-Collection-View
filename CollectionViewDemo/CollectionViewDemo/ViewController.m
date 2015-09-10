//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by guojun on 9/10/15.
//  Copyright (c) 2015 guojunxu. All rights reserved.
//

#import "ViewController.h"
#import "KSubject.h"
#import "KSubjectView.h"

@interface ViewController ()<KSubjectViewDelegate>

@property (nonatomic, weak) IBOutlet KSubjectView *subjectCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主题";

    // test data
    KSubject *subject1 = [KSubject new];
    subject1.title = @"拍摄主题";
    subject1.keywords = @[@"人像写真", @"自然", @"旅行", @"建筑", @"夜景", @"人体", @"儿童", @"新闻", @"专题", @"体育", @"民俗", @"时尚", @"婚纱", @"商品", @"静物", @"动物", @"宠物", @"昆虫", @"花卉", @"创意", @"观念", @"黑白", @"行为", @"幽默", @"特写", @"其他", @"手机", @"LOMO"];
    
    KSubject *subject2 = [KSubject new];
    subject2.title = @"拍摄教学";
    subject2.keywords = @[@"器材评测", @"基础教学", @"用光技巧", @"影棚技巧", @"后期技巧", @"其他技巧"];
    
    KSubject *subject3 = [KSubject new];
    subject3.title = @"拍摄器材";
    subject3.keywords = @[@"手机", @"数码相机", @"微单/单电", @"旁轴", @"单反", @"镜头", @"三角架", @"闪光灯", @"手写板", @"其他"];
    
    KSubject *subject4 = [KSubject new];
    subject4.title = @"拍摄软件";
    subject4.keywords = @[@"移动应用", @"桌面应用"];
    
    self.subjectCollectionView.subjects = @[subject1, subject2, subject3, subject4];
}

#pragma mark - KSubjectViewDelegate
- (void)subjectCollectionView:(KSubjectView *)view didSelectCellAtIndex:(NSIndexPath *)indexPath{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
