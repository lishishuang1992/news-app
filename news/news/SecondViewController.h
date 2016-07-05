//
//  SecondViewController.h
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myModelObject.h"
#import "GetJson.h"
#import "SecondCell.h"
#import "DocumentPath.h"
#import "Reachability.h"
#import "ThirdViewController.h"
#import "MJRefreshHeaderView.h"
#import "MJRefreshFooterView.h"
@interface SecondViewController : UIViewController<MJRefreshBaseViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end
