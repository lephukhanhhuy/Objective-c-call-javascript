//
//  ViewController.m
//  CallJSFunctions
//
//  Created by Codespot on 3/15/13.
//  Copyright (c) 2013 Codespot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    m_results = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 310, 300)];
    [self.view addSubview:m_results];
    m_results.backgroundColor = [UIColor clearColor];
    m_results.text = @"Results will show here";
    m_results.textAlignment = NSTextAlignmentCenter;
    m_results.lineBreakMode = UILineBreakModeWordWrap;
    m_results.numberOfLines = 0;
    
    UIButton* btnAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btnAdd];
    [btnAdd setFrame:CGRectMake(10, 200, 200, 50)];
    [btnAdd setTitle:@"Call add(a,b)" forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(btnCallAdd) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnSplit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btnSplit];
    [btnSplit setFrame:CGRectMake(10, 300, 200, 50)];
    [btnSplit setTitle:@"Call split(name)" forState:UIControlStateNormal];
    [btnSplit addTarget:self action:@selector(btnCallSplit) forControlEvents:UIControlEventTouchUpInside];
}
- (void) btnCallAdd
{
    //add(a,b)
    id result = [JS callJSFunction:@"add(1,2)"];
    m_results.text = [NSString stringWithFormat:@"btnCallAdd: %@",result];
}

- (void) btnCallSplit
{
    //add(a,b)
    NSString* str = @"Codespot mobile delvelopment";
    
    id result = [JS callJSFunction:[NSString stringWithFormat:@"split('%@')",str]];
    m_results.text = [NSString stringWithFormat:@"btnCallSplit: %@", result];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
