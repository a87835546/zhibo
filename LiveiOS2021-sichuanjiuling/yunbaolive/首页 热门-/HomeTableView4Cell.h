//
//  HomeTableView4Cell.h
//  yunbaolive
//
//  Created by Jay on 2022/7/21.
//  Copyright © 2022 cat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableView4Cell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewhight;
@end

NS_ASSUME_NONNULL_END
