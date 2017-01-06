//
// Created by jason9075 on 2017/1/6.
// Copyright (c) 2017 jason9075.com. All rights reserved.
//

#import "View+MASAdditions.h"
#import "CollectionViewHeader.h"


@implementation CollectionViewHeader {
    UILabel *_titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];

        _titleLabel = [UILabel new];

        [self addSubview:_titleLabel];

        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
        }];

    }

    return self;
}

- (void)setHeaderTitle:(NSString *)text {
    [_titleLabel setText:text];
}


+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}
@end