//
//  HomeCell.h
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@protocol HomeCellDelegate <NSObject>

-(void)buttonRespond:(id)sender;

@end
@interface HomeCell : UITableViewCell
{
    id<HomeCellDelegate>_delegate;
}

@property(nonatomic,strong)NSArray *nameArray;
@property(strong,nonatomic)id<HomeCellDelegate>delegate;


-(void)cellIndex :(NSInteger) index;
@end
