/* 
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import <UIKit/UIKit.h>

@interface UIView (KalAdditions)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;
@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;
/**
 *  视图的frame数据
 *
 *  @param view 要打印信息的视图
 */
- (void)LogViewFrame:(UIView *)view;
/**
 *  获取当前View所在的UINavigationController
 *
 *  @return UINavigationController 对象
 */
- (UINavigationController *)navigationController;

/**
 *  获取当前View所在的ViewController对象
 *
 *  @return UIViewController 对象
 */
- (UIViewController *) viewController;
@end

@interface UILabel (Additions)
+ (UILabel*)labelWithFrame:(CGRect)frame fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color;
/**自定义字体*/
+ (UILabel*)labelWithFrame:(CGRect)frame fontName:(NSString *)fontName fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color;
@end

@interface UIImageView (Additions)
+ (UIImageView*)imageViewWithFrame:(CGRect)frame imageStr:(NSString*)imageStr;
@end

@interface UIButton (Additions)
+ (UIButton*)buttonWithFrame:(CGRect)frame fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color target:(id)target action:(SEL)action;
/**自定义字体*/
+ (UIButton*)buttonWithFrame:(CGRect)frame fontName:(NSString *)fontName fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color target:(id)target action:(SEL)action;
+ (UIButton*)buttonWithFrame:(CGRect)frame normalImageStr:(NSString*)normalImageStr selectedImageStr:(NSString*)selectedImageStr target:(id)target action:(SEL)action;
+ (UIButton*)buttonWithFrame:(CGRect)frame normalImageStr:(NSString*)normalImageStr highlightedImageStr:(NSString*)highlightedImageStr target:(id)target action:(SEL)action;
@end
