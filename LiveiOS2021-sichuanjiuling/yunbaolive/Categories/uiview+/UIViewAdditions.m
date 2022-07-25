/* 
 * Copyright (c) 2009 Keith Lazuka
 * License: http://www.opensource.org/licenses/mit-license.html
 */

#import "UIViewAdditions.h"

@implementation UIView (KalAdditions)

- (CGFloat)left
{
  return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
  CGRect frame = self.frame;
  frame.origin.x = x;
  self.frame = frame;
}

- (CGFloat)right
{
  return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
  CGRect frame = self.frame;
  frame.origin.x = right - frame.size.width;
  self.frame = frame;
}

- (CGFloat)top
{
  return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
  CGRect frame = self.frame;
  frame.origin.y = y;
  self.frame = frame;
}

- (CGFloat)bottom
{
  return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
  CGRect frame = self.frame;
  frame.origin.y = bottom - frame.size.height;
  self.frame = frame;
}

- (CGFloat)width
{
  return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
  CGRect frame = self.frame;
  frame.size.width = width;
  self.frame = frame;
}

- (CGFloat)height
{
  return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
  CGRect frame = self.frame;
  frame.size.height = height;
  self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (void)LogViewFrame:(UIView *)view
{
    DLog(@"%@ : x -- %f, y -- %f, width -- %f, height -- %f",NSStringFromClass([view class]),self.left,self.top,self.width,self.height);
}

- (UINavigationController *)navigationController
{
    for (UIView * next = [self superview]; next; next = next.superview)
    {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]])
        {
            return (UINavigationController *)nextResponder;
        }
    }
    return nil;
}

-(UIViewController *)viewController
{
    for (UIView * next = [self superview]; next; next = next.superview)
    {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end

@implementation UILabel (Additions)
+ (UILabel*)labelWithFrame:(CGRect)frame fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color
{
    UILabel *label = [[UILabel alloc] initWithFrame: frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:size];
    label.text = text;
    label.textColor = color;
    return label;
}
+ (UILabel*)labelWithFrame:(CGRect)frame fontName:(NSString *)fontName fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color
{
    UILabel *label = [[UILabel alloc] initWithFrame: frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:fontName size:size];
    label.text = text;
    label.textColor = color;
    return label;
}
@end

@implementation UIImageView (Additions)
+ (UIImageView*)imageViewWithFrame:(CGRect)frame imageStr:(NSString*)imageStr
{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame: frame];
    imageV.image = [UIImage imageNamed:imageStr];
    return imageV;
}
@end


@implementation UIButton (Additions)
+ (UIButton*)buttonWithFrame:(CGRect)frame fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:size];
    [btn addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonWithFrame:(CGRect)frame fontName:(NSString *)fontName fontSize:(double)size text:(NSString*)text textColor:(UIColor*)color target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:fontName size:size];
    [btn addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonWithFrame:(CGRect)frame normalImageStr:(NSString*)normalImageStr selectedImageStr:(NSString*)selectedImageStr target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setImage:[UIImage imageNamed:normalImageStr] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageStr]  forState:UIControlStateSelected];
    [btn addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton*)buttonWithFrame:(CGRect)frame normalImageStr:(NSString*)normalImageStr highlightedImageStr:(NSString*)highlightedImageStr target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] initWithFrame: frame];
    [btn setImage:[UIImage imageNamed:normalImageStr] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageStr]  forState:UIControlStateHighlighted];
    [btn addTarget: target action: action forControlEvents: UIControlEventTouchUpInside];
    return btn;
}
@end
