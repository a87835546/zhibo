//
//  HomeTableView5Cell.m
//  yunbaolive
//
//  Created by Jay on 2022/7/21.
//  Copyright © 2022 cat. All rights reserved.
//

#import "HomeTableView5Cell.h"


@implementation HomeTableView5Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 280)];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.bottomView addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(100*4, 280);
    
    [self setdata:nil];
    
}

- (void)setdata:(NSDictionary *)dict{
    [self.scrollView removeAllSubviews];
    int x = 0;
    int y = 0;
    for (int i=0; i<8; i++) {
        x=i;
        if (i>3) {
            x=i-4;
            y=140;
        }
        [self.scrollView addSubview:[self icon:CGRectMake(x*100, y, 100, 140)]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView *)icon:(CGRect)frame{
    UIView *v = [[UIView alloc]initWithFrame:frame];
    UIImageView *imageV = [UIImageView imageViewWithFrame:CGRectMake(0, 0, 100, 100) imageStr:@"pii.png"];
    [v addSubview:imageV];
    UILabel *label = [UILabel labelWithFrame:CGRectMake(0, 105, 100, 30) fontSize:12 text:@"盘点皇马最贵引援盘点皇马最贵引援" textColor:Hex(@"#333333")];
    label.numberOfLines = 2;
    [v addSubview:label];
    return  v;
}

@end
