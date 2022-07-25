//
//  HomeTableView1Cell.m
//  yunbaolive
//
//  Created by Jay on 2022/7/21.
//  Copyright © 2022 cat. All rights reserved.
//

#import "HomeTableView1Cell.h"
#import "Home1CollectionViewCell.h"
@implementation HomeTableView1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.backgroundColor = .black
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = NO;
//    self.collectionView.backgroundColor = HEX(0xD8D8D8)
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
    layout.minimumInteritemSpacing = 1.0;
    layout.minimumLineSpacing = 1.0; //设置行间距
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 30)/2, 144*SCREEN_RATIO);
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerNib:[UINib nibWithNibName:@"Home1CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Home1CollectionViewCell"];
    [self reloadData:nil];
}

-(void)reloadData:(NSDictionary *)dict {
    //设置标题
//    self.titleLabel.text = title
    //collectionView重新加载数据
    [self.collectionView reloadData];
    //更新collectionView的高度约束
    CGSize contentSize = self.collectionView.collectionViewLayout.collectionViewContentSize;
    self.collectionViewhight.constant = 144*SCREEN_RATIO*3;//contentSize.height;
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Home1CollectionViewCell *cell = (Home1CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Home1CollectionViewCell" forIndexPath:indexPath];
//    NSDictionary *subdic = _allArray[indexPath.row];
//    cell.videoModel = [[NearbyVideoModel alloc] initWithDic:subdic];
    return cell;
}
@end
