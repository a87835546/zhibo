//
//  Home2CollectionViewCell.m
//  yunbaolive
//
//  Created by Jay on 2022/7/21.
//  Copyright © 2022 cat. All rights reserved.
//

#import "Home2CollectionViewCell.h"

@implementation Home2CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
}

@end
