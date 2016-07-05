//
//  SecondViewController.m
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController
{
    NSMutableArray *listArray;
    MJRefreshHeaderView *_header;
    MJRefreshFooterView *_footer;
    BOOL isLoadMore;
    NSString *string;
    NSData *theData;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    UIImageView *_titleImage = [[UIImageView alloc]init];
    _titleImage.frame = CGRectMake(0, 0, MainScreenWidth, 44);
    _titleImage.backgroundColor = [UIColor grayColor];
    _titleImage.userInteractionEnabled = YES;
    [self.view addSubview:_titleImage];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, MainScreenWidth, 0.5)];
    lineView.backgroundColor = LINERGBA;
    [_titleImage addSubview:lineView];
    [_titleImage addSubview:lineView];
    
    UILabel *_titleLabel = [[UILabel alloc]init];
    _titleLabel.text = @"新闻概览";
    [_titleLabel setTextColor:RGBA(51, 51, 51)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont systemFontOfSize:20.0]];
    _titleLabel.frame = CGRectMake(50, 10, MainScreenWidth-100, 34);
    [_titleImage addSubview:_titleLabel];

    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 11, 30, 20)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"fanhuijiantou"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(gobackViewConteoller) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    [_titleImage addSubview:backButton];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, MainScreenWidth, MainScreenHEIGHT-44) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    _header = [self createFreash:self.tableView andHeader:_header];
    _footer = [self createFreash:self.tableView andFooter:_footer];

    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self showHudInView:self.tableView hint:@"加载中..."];
    [self doucmentData];
    if ([theData length]>0) {
        [self hideHud];
        [self.tableView reloadData];
    }else{
        NSString *site = @"http://v.juhe.cn";
        Reachability *reach = [Reachability reachabilityWithHostName:site];
        if ([reach currentReachabilityStatus]== NotReachable) {   //没有网络
            [self hideHud];
            [self showHudInView:self.view showHint:@"请检查网络"];
        }else if ([reach currentReachabilityStatus]== ReachableViaWWAN||[reach currentReachabilityStatus]== ReachableViaWiFi){
            [self loadDataSource];
            [self hideHud];
        }else{
        }
    }
}

-(void)stopRefresh{
    [_header endRefreshing];
    [_footer endRefreshing];
}


-(void)doucmentData{
    string = [[NSUserDefaults standardUserDefaults] objectForKey:@"searchname"];
    theData = [NSData dataWithContentsOfFile:[DocumentPath newsDataSource:string]];
    listArray = [[NSMutableArray alloc] init];
    NSKeyedUnarchiver *archiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:theData];
    listArray = [archiver decodeObjectForKey:@"ARCHIVE_KEY"];
    [archiver finishDecoding];

}
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    if (refreshView ==_header) {
        isLoadMore = NO;
    }
    else
    {
        isLoadMore = YES;
    }
    [self performSelector:@selector(loadDataSource) withObject:nil];
}
-(void)loadDataSource{
    GetJson *getjson = [[GetJson alloc] init];
    [getjson downloadTask];
    [self doucmentData];
    [self.tableView reloadData];
    [self stopRefresh];
    
}

-(MJRefreshFooterView *)createFreash:(UITableView *)tableView andFooter:(MJRefreshFooterView *)footer{
    //上拉刷新
    footer = [[MJRefreshFooterView alloc] init];
    footer.delegate = self;
    footer.scrollView = tableView;
    return footer;
}

-(MJRefreshHeaderView *)createFreash:(UITableView *)tableView andHeader:(MJRefreshHeaderView *)header{
    // 下拉刷新
    header = [[MJRefreshHeaderView alloc] init];
    header.delegate = self;
    header.scrollView = tableView;
    return header;
}


-(void)gobackViewConteoller{
    [self.navigationController popViewControllerAnimated:YES];
}




#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"[listArray count]::%lu",(unsigned long)[listArray count]);
    return [listArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == NULL)
    {
        cell = [[SecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell myModel:listArray[indexPath.row]];
    
    return cell;
}


#pragma mark - UITableViewDelegate

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
    //return MainScreenWidth/750*132+MainScreenWidth/750*265*listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThirdViewController *thirdController = [[ThirdViewController alloc] init];
    myModelObject  *model = listArray[indexPath.row];
    thirdController.webUrl = model.contentUrl;
    [self.navigationController pushViewController:thirdController animated:YES];
    
    
    //    [self.navigationController pushViewController:userVC animated:YES];
}
@end
