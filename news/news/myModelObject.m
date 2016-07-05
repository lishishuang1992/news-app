//
//  myModelObject.m
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "myModelObject.h"

@implementation myModelObject
@synthesize title;
@synthesize author_name;
@synthesize date;
@synthesize imageUrl;
@synthesize contentUrl;

static myModelObject *instance;
static NSString *path;

//单利
+(instancetype)instance{
  
    static dispatch_once_t once;
    dispatch_once(&once,^{
        instance = [[self alloc] init];
    });
    return instance;

}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:title forKey:@"title"];
    [aCoder encodeObject:date forKey:@"date"];
    [aCoder encodeObject:author_name forKey:@"author_name"];
    [aCoder encodeObject:imageUrl forKey:@"imageUrl"];
    [aCoder encodeObject:contentUrl forKey:@"contentUrl"];

}

-(id)initWithCoder:(NSCoder *)aDecoder{
    title = [aDecoder decodeObjectForKey:@"title"];
    date = [aDecoder decodeObjectForKey:@"date"];
    author_name =[aDecoder decodeObjectForKey:@"author_name"];
    imageUrl = [aDecoder decodeObjectForKey:@"imageUrl"];
    contentUrl = [aDecoder decodeObjectForKey:@"contentUrl"];
    return self;
}



-(instancetype)init{
    self = [super init];
    if (self) {
        self.title = [[NSString alloc] init];
        self.author_name = [[NSString alloc] init];
        self.date = [[NSString alloc] init];
        self.imageUrl = [[NSString alloc] init];
        self.contentUrl = [[NSString alloc] init];
    }
    return  self;
}

-(void)saveData{
    
    [NSKeyedArchiver archiveRootObject:instance toFile:path];
}




@end
