//
//  ShopWebVC.m
//  yunbaolive
//
//  Created by ybRRR on 2020/8/18.
//  Copyright © 2022 cat. All rights reserved.
//

#import "ShopWebVC.h"
#import <WebKit/WebKit.h>

@interface ShopWebVC ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *contentWebView;
@end

@implementation ShopWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
//    self.title = ZBLocalized(@"Sports betting", nil);
    
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
//    [userContentController addScriptMessageHandler:self name:@"Player"];

    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = userContentController;
    
    self.contentWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NavigationBarHeight-TabBarHeight) configuration:configuration];
    self.contentWebView.backgroundColor = [UIColor whiteColor];
    self.contentWebView.UIDelegate = self;
    // 导航代理
    self.contentWebView.navigationDelegate = self;
    // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
    self.contentWebView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.contentWebView];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    [self.contentWebView loadRequest:request];
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    [MBProgressHUD showAnimationForView:self.view];
//    DLog(@"开始加载");
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
//    DLog(@"已经请求");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view];
//    DLog(@"请求失败-----%@",error);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation
{
//    DLog(@"1");
}
 
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
//    DLog(@"2");
    [MBProgressHUD hideHUDForView:self.view];
//    NSHTTPCookieStorage *cookiesStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    NSURLRequest *urlReq = webView.request;
//    NSURL *url = urlReq.URL;
//    NSArray *cookies = [cookiesStorage [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url]];
}


 
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view];
//    DLog(@"3");
}


//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler
//{
//    DLog(@"4");
//
//
//}

@end
