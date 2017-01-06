//
// Created by jason9075 on 2017/1/6.
// Copyright (c) 2017 jason9075.com. All rights reserved.
//

#import "CollectionViewCell.h"
#import "View+MASAdditions.h"


@implementation CollectionViewCell {

    UIView *_thumbnail;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        [self setBackgroundColor:[UIColor blackColor]];
        _thumbnail = [UIView new];
        [_thumbnail setBackgroundColor:[UIColor blueColor]];

        [self.contentView addSubview:_thumbnail];

        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];

        [_thumbnail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.mas_equalTo(4);
            make.trailing.bottom.mas_equalTo(-4);
        }];


    }

    return self;
}

-(void) setThumbnailColor:(UIColor *)color{
    [_thumbnail setBackgroundColor:color];
}

+ (NSString *)identifier {
    return  NSStringFromClass([self class]);
}

@end