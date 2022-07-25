//
//  Home1CollectionViewCell.m
//  yunbaolive
//
//  Created by Jay on 2022/7/21.
//  Copyright © 2022 cat. All rights reserved.
//

#import "Home1CollectionViewCell.h"

@implementation Home1CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 5;
    frame.size.width -= 10;
//    frame.origin.y += 5;
//    frame.size.height -= 10;

    [super setFrame:frame];
}
@end
