//
//  HomeViewController.m
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
{
    UITableView *mytableview;
    NSInteger index;
    SecondViewController *secondController;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    secondController= [[SecondViewController alloc] init];
    [self.navigationController setNavigationBarHidden:YES];
    self.nameArray = [[NSArray alloc] initWithObjects:@"toutiao",@"shehui",@"yule",@"keji",@"junshi",@"caijing",@"guonei",@"guoji",@"shishang",@"tiyu", nil];
    self.view.backgroundColor = [UIColor whiteColor];
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
    _titleLabel.text = @"新闻";
    [_titleLabel setTextColor:RGBA(51, 51, 51)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont systemFontOfSize:20.0]];
    _titleLabel.frame = CGRectMake(50, 10, MainScreenWidth-100, 34);
    [_titleImage addSubview:_titleLabel];
    mytableview = [[UITableView alloc] init];
    [self.view addSubview:mytableview];
    mytableview.delegate = self;
    mytableview.dataSource = self;
    mytableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [mytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == NULL)
    {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    index = indexPath.row;
    [cell cellIndex:index];
    
    
    return cell;
}

#pragma HomeDelegate

-(void)buttonRespond:(id)sender{
    UIButton *button  = (UIButton *)sender;
    [[NSUserDefaults standardUserDefaults] setObject:self.nameArray[button.tag] forKey:@"searchname"];
    
    [self.navigationController pushViewController:secondController animated:YES];

}
@end
