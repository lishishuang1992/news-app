//
//  HomeViewController.h
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "HomeCell.h"
#import "SecondViewController.h"
#import "GetJson.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,HomeCellDelegate>

@property(nonatomic,strong)NSArray *nameArray;
@end
