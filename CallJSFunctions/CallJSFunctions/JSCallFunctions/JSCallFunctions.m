//
//  JSCallFunctions.m
//  CallJSFunctions
//
//  Created by Codespot on 3/15/13.
//  Copyright (c) 2013 Codespot. All rights reserved.
//

#import "JSCallFunctions.h"

JSCallFunctions* JS;

@implementation JSCallFunctions
@synthesize mWebViewJS = m_webViewJS;
@synthesize mDidLoadJS;

+ (void) loadJSWithRootViewController:(UIViewController*) vc
{
    JS = [[JSCallFunctions alloc] initWithViewController:vc];
}

- (id) initWithViewController:(UIViewController*) vc
{
    self = [super init];
    if (self)
    {
        self.mWebViewJS = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        [self.mWebViewJS loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
        self.mWebViewJS.hidden = YES;
        self.mWebViewJS.delegate = self;
        [vc.view addSubview:m_webViewJS];
        
        self.mDidLoadJS = NO;
    }
    return self;
}
- (id) callJSFunction:(NSString*) function
{
    if (self.mDidLoadJS)
    {
        return [self.mWebViewJS stringByEvaluatingJavaScriptFromString:function];
    }
    NSLog(@"Cannot call js, please load js in application:didFinishLaunchingWithOptions first!!");
    return nil;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.mDidLoadJS = YES;
    NSLog(@"Did load JS");
}

- (void)dealloc
{
    self.mWebViewJS = nil;
    [super dealloc];
}

@end
