//
//  GetJson.h
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "myModelObject.h"
#import "AFNetworking.h"
#import "DocumentPath.h"
@interface GetJson : NSObject

@property(nonatomic,strong)NSString *search;
-(void)downloadTask;
@end
