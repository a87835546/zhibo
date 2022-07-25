//
//  Home1ViewController.m
//  yunbaolive
//
//  Created by Jay on 2022/7/20.
//  Copyright © 2022 cat. All rights reserved.
//

#import "Home1ViewController.h"
#import "SDCycleScrollView.h"
#import "HomeTableView1Cell.h"
#import "HomeTableView2Cell.h"
#import "HomeTableView3Cell.h"
#import "HomeTableView4Cell.h"
#import "HomeTableView5Cell.h"
@interface Home1ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SDCycleScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *infoArray;
@property (nonatomic, strong) NSMutableArray *zhuboModel;
@property (nonatomic,strong)SDCycleScrollView *cycleScroll;
@property(nonatomic,strong)NSArray *CarouselArray;//轮播图
@property(nonatomic,assign)int page;
@end
static NSString *const oneCell = @"HomeTableView1Cell";
static NSString *const twoCell = @"HomeTableView2Cell";
static NSString *const threeCell = @"HomeTableView3Cell";
static NSString *const fourCell = @"HomeTableView4Cell";
static NSString *const fiveCell = @"HomeTableView5Cell";
@implementation Home1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoArray    =  [NSMutableArray array];
    self.zhuboModel    =  [NSMutableArray array];
    self.page = 1;
    [self setUpUI];
    [self getRequest];
}

- (void)setUpUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NavigationBarHeight-40-TabBarHeight) style:UITableViewStylePlain];
//    self.tableView.backgroundColor = ViewBGColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = [self setUptableHeaderView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:oneCell bundle:nil] forCellReuseIdentifier:oneCell];
    [self.tableView registerNib:[UINib nibWithNibName:twoCell bundle:nil] forCellReuseIdentifier:twoCell];
    [self.tableView registerNib:[UINib nibWithNibName:threeCell bundle:nil] forCellReuseIdentifier:threeCell];
    [self.tableView registerNib:[UINib nibWithNibName:fourCell bundle:nil] forCellReuseIdentifier:fourCell];
    [self.tableView registerNib:[UINib nibWithNibName:fiveCell bundle:nil] forCellReuseIdentifier:fiveCell];
    self.tableView.estimatedRowHeight = 300.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (UIView *)setUptableHeaderView {
    UIView *hv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200*SCREEN_RATIO)];
    _cycleScroll = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(10, 12*SCREEN_RATIO, SCREEN_WIDTH-20, 176*SCREEN_RATIO)];
    _cycleScroll.delegate = self;
    _cycleScroll.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [hv addSubview:_cycleScroll];
    _cycleScroll.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _cycleScroll.autoScrollTimeInterval = 3.0;//轮播时间间隔，默认1.0秒，可自定义
    _cycleScroll.currentPageDotColor = [UIColor whiteColor];
    _cycleScroll.pageDotColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
    _cycleScroll.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _cycleScroll.layer.cornerRadius = 8;
    _cycleScroll.layer.masksToBounds = YES;
    //ray416--begin----
    return hv;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        HomeTableView2Cell *myTwoCell = [tableView dequeueReusableCellWithIdentifier:twoCell forIndexPath:indexPath];
        return myTwoCell;
    }else if (indexPath.row == 1) {
        HomeTableView1Cell *myOneCell = [tableView dequeueReusableCellWithIdentifier:oneCell forIndexPath:indexPath];
        return myOneCell;
    }else if (indexPath.row == 2) {
        HomeTableView3Cell *myOneCell = [tableView dequeueReusableCellWithIdentifier:threeCell forIndexPath:indexPath];
        return myOneCell;
    }else if (indexPath.row == 3) {
        HomeTableView4Cell *myOneCell = [tableView dequeueReusableCellWithIdentifier:fourCell forIndexPath:indexPath];
        return myOneCell;
    }else if (indexPath.row == 4) {
        HomeTableView5Cell *eCell = [tableView dequeueReusableCellWithIdentifier:fiveCell forIndexPath:indexPath];
        return eCell;
    }
    HomeTableView1Cell *myOneCell = [tableView dequeueReusableCellWithIdentifier:oneCell forIndexPath:indexPath];
    return myOneCell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row == 0) {
//        return screenHeight/3.2;
//    }else {
//        return screenHeight-screenHeight/3.2-TabBarHeight-NavigationBarHeight;
//    }
//}

-(void)getRequest {
    [YBToolClass postNetworkWithUrl:@"Home.GetHot" andParameter:@{@"p":@(self.page)} success:^(int code,id info,NSString *msg) {
//        [self.tableView.mj_header endRefreshing];
//        [self.tableView.mj_footer endRefreshing];
        if (code == 0) {
                NSArray *infoA = [info objectAtIndex:0];
                NSArray *list = [infoA valueForKey:@"list"];
//                if (page == 1) {
                    [_infoArray removeAllObjects];
                    [_zhuboModel removeAllObjects];
                    self.CarouselArray = [infoA valueForKey:@"slide"];
                    NSMutableArray *sliderMuArr = [NSMutableArray array];
                    for (NSDictionary *dic in _CarouselArray) {
                        [sliderMuArr addObject:minstr([dic valueForKey:@"slide_pic"])];
                    }
                    _cycleScroll.imageURLStringsGroup = sliderMuArr;
//                    self.recommendArray = [infoA valueForKey:@"recommend"];
//                    [self createCollectionHeaderView];

//                }
//                [_infoArray addObjectsFromArray:list];
//                for (NSDictionary *dic in list) {
//                    hotModel *model = [[hotModel alloc]initWithDic:dic];
//                    [_zhuboModel addObject:model];
//                }
//                [_collectionView reloadData];
//                if (_infoArray.count < 1) {
//                    noDataView.hidden = NO;
//                    noDataView.frame = CGRectMake(0, collectionHeaderView.height+20, _window_width, 40);
//                }else{
//                    noDataView.hidden = YES;
//                }
//            if (list.count == 0) {
//                [_collectionView.mj_footer endRefreshingWithNoMoreData];
//            }
        }
    } fail:^{
//        [_collectionView.mj_header endRefreshing];
//        [_collectionView.mj_footer endRefreshing];
//        if (_infoArray.count == 0) {
//            noNetwork.hidden = NO;
//        }
    }];
}
@end
