//
//  ViewController.m
//  CollectionView-Programatticly
//
//  Created by jason9075 on 2017/1/6.
//  Copyright © 2017年 jason9075.com. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "View+MASAdditions.h"

static const int NUMBER_OF_COLUMN = 3;

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController {
    UICollectionView *_collectionView;
    NSArray<NSString*> *_sectionTitle;
}

- (void)loadView {
    [super loadView];
    _sectionTitle = @[@"區塊一", @"區塊二"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:[CollectionViewCell identifier]];

    [self.view addSubview:_collectionView];

    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.mas_equalTo(4);
        make.trailing.bottom.mas_equalTo(-4);
    }];
}

#pragma - CollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _sectionTitle.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section){
        case 0:
            return 5;
        case 1:
            return 13;
        default:
            return 0;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionViewCell identifier] forIndexPath:indexPath];

    switch (indexPath.section){
        case 0:
            break;
        case 1:
            [cell setThumbnailColor:[UIColor yellowColor]];
            break;
        default:
            break;

    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) collectionViewLayout;
    CGFloat totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * NUMBER_OF_COLUMN - 1);
    CGFloat size = (collectionView.bounds.size.width - totalSpace) / NUMBER_OF_COLUMN;

    return CGSizeMake(size, size);
}


@end
