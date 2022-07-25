//
//  WBTabBarController.m
//  yunbaolive
//
//  Created by Jay on 2022/7/20.
//  Copyright © 2022 cat. All rights reserved.
//

#import "WBTabBarController.h"
#import "HomeNewVC.h"
#import "DynamicHomeVC.h"
#import "ShopWebVC.h"
#import "YBUserInfoViewController.h"

@interface WBTabBarController ()
@property (nonatomic, strong) UIView *tabbarBackgroundView;
@property (nonatomic, strong) NSString *lastIndexStr;
@property (nonatomic, assign) NSInteger indexFlag;
@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupChildControllers];
    self.selectedViewController = [self.viewControllers objectAtIndex:0];
    
    
    if (@available(iOS 11.0, *)) {
        self.tabBar.layer.cornerRadius = 16;
        self.tabBar.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
        self.tabBar.layer.masksToBounds = YES;
        self.tabBar.layer.borderWidth = 1;
        self.tabBar.layer.borderColor = HexAlp(@"B6BCCB", 0.2).CGColor;
    } else {
        // Fallback on earlier versions
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.tabBar.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(16,16)];
        //创建 layer
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.tabBar.bounds;
        //赋值
        maskLayer.path = maskPath.CGPath;
        self.tabBar.layer.mask = maskLayer;
    }
//    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//
//    UIGraphicsBeginImageContext(rect.size);
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//
//    CGContextFillRect(context, rect);
//
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//
//    UIGraphicsEndImageContext();
//
//    [self.tabBar setBackgroundImage:img];
//
//    [self.tabBar setShadowImage:img];
}

- (void)setupChildControllers
{
    [self setupChildVC:[[HomeNewVC alloc]init] image:@"tabbar1" andSelectImage:@"tabbar1select" title:@"首页"];
    [self setupChildVC:[[DynamicHomeVC alloc]init] image:@"tabbar2" andSelectImage:@"tabbar2select" title:@"动态"];
    [self setupChildVC:[[ShopWebVC alloc]init] image:@"tabbar3" andSelectImage:@"tabbar3select" title:@"比分"];
    [self setupChildVC:[[YBUserInfoViewController alloc]init] image:@"tabbar4" andSelectImage:@"tabbar4select" title:@"我的"];
}

- (void)setupChildVC:(UIViewController *)VC image:(NSString * )image andSelectImage:(NSString *)selectImage title:(NSString *)title
{
    RTRootNavigationController *thirdNav = [[RTRootNavigationController alloc] initWithRootViewController:VC];
    thirdNav.tabBarItem.title = title;
    thirdNav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdNav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:thirdNav];
}

-(void)setTabBarSelectIndex:(NSUInteger)index
{
    [self setSelectedIndex:index];
}

+ (void)load{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *attrsSelected = [NSMutableDictionary dictionary];
    attrsSelected[NSForegroundColorAttributeName] = Hex(@"4B86F2");
    [item setTitleTextAttributes:attrsSelected forState:UIControlStateSelected];
//    item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);//修改上下的位置
//    item.imageInsets = UIEdgeInsetsMake(6, 6, -6, 0);//修改位置和大小

    NSMutableDictionary *attrsNormal = [NSMutableDictionary dictionary];
    attrsNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrsNormal[NSForegroundColorAttributeName] = Hex(@"222222");
    [item setTitleTextAttributes:attrsNormal forState:UIControlStateNormal];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
//    [UITabBar appearance].translucent = YES;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tabbarBackgroundView.frame = self.tabBar.frame;
}

- (void)dealloc{
    DLog(@"%@释放了",self.class);
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    DLog(@"%@",item.title);
//    if ([self.lastIndexStr isEqualToString: ZBLocalized(@"Home", nil)]&&[item.title isEqualToString: ZBLocalized(@"Home", nil)]) {
//        RTRootNavigationController *nav = self.childViewControllers.firstObject;
//        MTHomeViewController *vc = (MTHomeViewController *)nav.rt_visibleViewController;
//        [vc scrollToTop];
//    }
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry1 = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry1 addObject:btn];
            }
        }
        //添加动画
        //---将下面的代码块直接拷贝到此即可---
        //放大效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        animation.fromValue = [NSNumber numberWithFloat:0.8];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.1];     //结束伸缩倍数
        UIView *btn = arry1[index];
        [[btn layer] addAnimation:animation forKey:nil];
        self.indexFlag = index;
    }
    
    self.lastIndexStr = item.title;
}

@end
