Objective-c-call-javascript
===========================

Call javascript from objective-c

So easy: 

1. Add JSCallFunctions folder to your projects
2. Add #import "JSCallFunctions.h" to your -Prefix.pch file
3. Add [JSCallFunctions loadJSWithRootViewController:self.viewController]; in application:didFinishLaunchingWithOptions, after init rootViewController
4. Add Javascript code in myjs.js:
Example:
function add(a,b)
{
    return (a + b);
}

5. How to call: id result = [JS callJSFunction:@"add(1,2)"];


Hope it useful!
