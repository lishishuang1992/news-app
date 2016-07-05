//
//  ThirdViewController.m
//  news
//
//  Created by 李世爽 on 16/7/3.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

@synthesize webUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *_titleImage = [[UIImageView alloc]init];
    _titleImage.frame = CGRectMake(0, 0, MainScreenWidth, 44);
    _titleImage.backgroundColor = [UIColor clearColor];
    _titleImage.userInteractionEnabled = YES;
    [self.view addSubview:_titleImage];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 11, 30, 20)];
    [_titleImage addSubview:backButton];
    [backButton setBackgroundImage:[UIImage imageNamed:@"fanhuijiantou"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(gobackViewConteoller) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, MainScreenWidth, 0.5)];
    lineView.backgroundColor = LINERGBA;
    [_titleImage addSubview:lineView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, MainScreenWidth, MainScreenHEIGHT-44)];
    NSLog(@"----%@",webUrl);
    NSURL *url = [NSURL URLWithString:webUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

-(void)gobackViewConteoller{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
