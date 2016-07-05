//
//  GetJson.m
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "GetJson.h"

@implementation GetJson

@synthesize search;

-(instancetype)init{
    self = [super init];
    if (self) {
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
        // 检测网络连接的单例,网络变化时的回调方法
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"%ld", (long)status);
        }];
        //[NSThread detachNewThreadSelector:@selector(downloadTask) toTarget:self withObject:nil];
    }
    return self;
}




- (void)downloadTask
{
    // 1. URL
        self.search = [[NSUserDefaults standardUserDefaults] objectForKey:@"searchname"];
        NSString *urlString = [NSString stringWithFormat:@"http://v.juhe.cn/toutiao/index?type=%@&key=b956bb2aba3f861c47c677e045941e3a",self.search];
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlString];
        // 2. Request
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2.0];
        // 3. Session
        NSURLSession *session = [NSURLSession sharedSession];
        // 4. download
        [[session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            
            NSData *data = [NSData dataWithContentsOfURL:location];
            
            NSString *strJson =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *jsonDictionary = [strJson objectFromJSONString];
            NSArray *newsArray = [[jsonDictionary objectForKey:@"result"] objectForKey:@"data"];
            
            NSMutableArray *tempArray = [[NSMutableArray alloc] init];
            
            for (NSDictionary *temp in newsArray) {
                myModelObject *myModel = [[myModelObject alloc] init];
                myModel.title =[temp objectForKey:@"title"];
                myModel.author_name =[temp objectForKey:@"author_name"];
                myModel.imageUrl =[temp objectForKey:@"thumbnail_pic_s03"];
                myModel.contentUrl =[temp objectForKey:@"url"];
                myModel.date =[temp objectForKey:@"date"];
                [tempArray addObject:myModel];
                NSLog(@"路径：%@",myModel.title);
            }
            NSMutableData *mydata = [NSMutableData data];
            NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mydata];
            [archiver encodeObject:tempArray forKey:@"ARCHIVE_KEY"];
            [archiver finishEncoding];
            [mydata writeToFile:[DocumentPath newsDataSource:self.search] atomically:YES];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"complete" object:nil];
            if (error) {
                NSLog(@"error%@",error);
            }
        }] resume];
    
}

@end
