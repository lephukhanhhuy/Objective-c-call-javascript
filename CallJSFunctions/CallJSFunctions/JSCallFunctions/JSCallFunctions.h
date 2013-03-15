//
//  JSCallFunctions.h
//  CallJSFunctions
//
//  Created by Codespot on 3/15/13.
//  Copyright (c) 2013 Codespot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSCallFunctions;

extern JSCallFunctions* JS;

@interface JSCallFunctions : NSObject <UIWebViewDelegate>
{
    UIWebView* m_webViewJS;
}
@property (retain) UIWebView* mWebViewJS;
@property BOOL mDidLoadJS;

+ (void) loadJSWithRootViewController:(UIViewController*) vc;
- (id) callJSFunction:(NSString*) function;
@end
