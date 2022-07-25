//
//  HomeTableView5Cell.h
//  yunbaolive
//
//  Created by Jay on 2022/7/21.
//  Copyright © 2022 cat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableView5Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) UIScrollView *scrollView;
@end

NS_ASSUME_NONNULL_END
