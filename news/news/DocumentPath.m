//
//  DocumentPath.m
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "DocumentPath.h"

static NSString *documentPath;

@implementation DocumentPath

+(void)initPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentPath = [paths lastObject];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    [fileManager createDirectoryAtPath:[NSString stringWithFormat:@"%@/newsDataSource",documentPath] withIntermediateDirectories:NO attributes:nil error:nil];
}

+(NSString *)newsDataSource :(NSString *)fielName{
    if (documentPath == nil) {
        [self initPath];
    }
    BOOL isDir;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *path = [NSString stringWithFormat:@"%@/%@",documentPath,fielName];
    [fileManager fileExistsAtPath:path isDirectory:&isDir];
    NSLog(@"_________________!_!!!!____%@",path);
    NSLog(@"文件是否存在：%d",isDir);
    if (isDir){
        [fileManager removeItemAtPath:path error:nil];
    }
    return path;
}




@end
