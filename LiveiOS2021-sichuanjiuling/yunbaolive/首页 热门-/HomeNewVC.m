//
//  HomeNewVC.m
//  yunbaolive
//
//  Created by Jay on 2022/7/20.
//  Copyright © 2022 cat. All rights reserved.
//

#import "HomeNewVC.h"
#import "Home1ViewController.h"

@interface HomeNewVC ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollV;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *titleV;
@property (nonatomic, assign) int page;
@property (nonatomic,strong)NSMutableArray *zhuboModel;//主播模型
@property (nonatomic,strong)NSMutableArray *infoArray;//获取到的主播列表信息
@property (nonatomic,strong)NSMutableArray *CarouselArray;
@end

@implementation HomeNewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.infoArray = [NSMutableArray array];
    self.zhuboModel = [NSMutableArray array];
    self.navigationController.navigationBarHidden = YES;
    [self setUpUI];
    [self pullInternet];
}

- (void)setUpUI {
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NavigationBarHeight+40)];
    topView.backgroundColor = Hex(@"4B86F2");
    [self.view addSubview:topView];
//    CAGradientLayer *gl = [CAGradientLayer layer];
//    gl.frame = CGRectMake(0,0,187.5,65);
//    gl.startPoint = CGPointMake(0.5, 0);
//    gl.endPoint = CGPointMake(0.5, 1);
//    gl.colors = @[(__bridge id)[UIColor colorWithRed:107/255.0 green:168/255.0 blue:246/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:75/255.0 green:134/255.0 blue:242/255.0 alpha:1.0].CGColor];
//    gl.locations = @[@(0), @(1.0f)];
//    topView.layer.cornerRadius = 5;
//    topView.layer.shadowColor = [UIColor colorWithRed:182/255.0 green:188/255.0 blue:203/255.0 alpha:0.1000].CGColor;
//    topView.layer.shadowOffset = CGSizeMake(0,1.5);
//    topView.layer.shadowOpacity = 1;
//    topView.layer.shadowRadius = 3;
    [self.view bringSubviewToFront:topView];
    
    
    UIView *searchV = [[UIView alloc]initWithFrame:CGRectMake(5, StatusBarHeight+14, SCREEN_WIDTH-60, 32)];
    searchV.backgroundColor = UIColor.whiteColor;
    searchV.layer.cornerRadius = 16;
    searchV.layer.masksToBounds = YES;
    [topView addSubview:searchV];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(5, 9, 14, 14)];
    icon.image = [UIImage imageNamed:@"shouye_search"];
    [searchV addSubview:icon];
    
    UIButton *hb = [UIButton buttonWithFrame:CGRectMake(SCREEN_WIDTH-50, StatusBarHeight+12, 40, 40) normalImageStr:@"shouye_hongbao" highlightedImageStr:@"shouye_hongbao" target:self action:@selector(hongbao)];
    [topView addSubview:hb];
    
    self.titleV = [[UIView alloc]initWithFrame:CGRectMake(0, NavigationBarHeight+10, SCREEN_WIDTH, 23)];
    [topView addSubview:self.titleV];
    
    self.line = [[UIView alloc]initWithFrame:CGRectMake(15, self.titleV.bottom, 20, 2)];
    self.line.backgroundColor = UIColor.whiteColor;
    [topView addSubview:self.line];
    
    NSArray *ar = @[@"推荐",@"快讯",@"足球",@"篮球",@"世界杯"];
    CGFloat w = 60;
    for (int i = 0; i<ar.count; i++) {
        Home1ViewController * workVc = [Home1ViewController new];
        [self addChildViewController:workVc];
        UIButton *btn = [UIButton buttonWithFrame:CGRectMake(i*w, 0, w, 20) fontSize:15 text:ar[i] textColor:UIColor.whiteColor target:self action:@selector (handlePanSlide:)];
        btn.tag = i;
        [self.titleV addSubview:btn];
        if (i==0) {
            [self handlePanSlide:btn];
        }
    }
    
    self.scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavigationBarHeight+40, SCREEN_WIDTH, SCREEN_HEIGHT-NavigationBarHeight-40-TabBarHeight)];
    self.scrollV.contentSize = CGSizeMake(SCREEN_WIDTH*ar.count, SCREEN_HEIGHT-NavigationBarHeight-40);
    self.scrollV.pagingEnabled = YES;
    self.scrollV.bounces = NO;
    self.scrollV.showsVerticalScrollIndicator=NO;
    self.scrollV.showsHorizontalScrollIndicator=NO;
    self.scrollV.delegate = self;
//    self.scrollV.userInteractionEnabled = YES;
    [self.view addSubview:self.scrollV];
}


- (void)handlePanSlide:(UIButton *)recognizer
{
    NSInteger i = recognizer.tag;
    [UIView animateWithDuration:0.15 animations:^{
        self.line.centerX = recognizer.centerX;
    }];
    CGFloat offsetX = i*SCREEN_WIDTH;
    self.scrollV.contentOffset = CGPointMake(offsetX, 0);
    [self addChildVC:i];
}

- (void)addChildVC:(NSInteger)index
{
    Home1ViewController *vc = self.childViewControllers[index];
    if (vc.isViewLoaded){
        return;
    }
    CGFloat offsetX = index * SCREEN_WIDTH;
    vc.view.frame = CGRectMake(offsetX, 0,SCREEN_WIDTH, self.scrollV.height);
    [self.scrollV addSubview:vc.view];
}

-(void)hongbao{
    
}

-(void)pullInternet{
    [YBToolClass postNetworkWithUrl:@"Home.GetHot" andParameter:@{@"p":@(_page)} success:^(int code,id info,NSString *msg) {

        if (code == 0) {
                NSArray *infoA = [info objectAtIndex:0];
                NSArray *list = [infoA valueForKey:@"list"];
//                if (_page == 1) {
//                    [_infoArray removeAllObjects];
//                    [_zhuboModel removeAllObjects];
                    self.CarouselArray = [infoA valueForKey:@"slide"];
//                    self.recommendArray = [infoA valueForKey:@"recommend"];
//                    [self createCollectionHeaderView];
//
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

    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

}
@end
