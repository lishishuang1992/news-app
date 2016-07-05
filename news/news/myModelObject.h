//
//  myModelObject.h
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DocumentPath.h"
@interface myModelObject : NSObject<NSCoding>
@property(strong,nonatomic)NSString *title;
@property(strong,nonatomic)NSString *author_name;
@property(strong,nonatomic)NSString *date;
@property(strong,nonatomic)NSString *contentUrl;
@property(nonatomic,strong)NSString *imageUrl;

+(instancetype)instance;
-(void)saveData;

@end
