//
//  myCell.m
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "SecondCell.h"
@implementation SecondCell
{
    UITextField *title;
    UIImageView *imageView;
    UILabel *author_name;
    UILabel *date;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        title = [[UITextField alloc] init];
        imageView = [[UIImageView alloc] init];
        author_name = [[UILabel alloc] init];
        date = [[UILabel alloc] init];
        [self addSubview:title];
        [self addSubview:imageView];
        [self addSubview:date];
        [self addSubview:author_name];
        [title  resignFirstResponder];
        title.textColor = RGBA(77, 77, 77);
        [title setFont:[UIFont systemFontOfSize:14]];
        [title setTextAlignment:NSTextAlignmentLeft];
        
        [date setFont:[UIFont systemFontOfSize:12]];
        [date setTextAlignment:NSTextAlignmentLeft];
        date.textColor = RGBA(153, 153, 153);
        
        [author_name setFont:[UIFont systemFontOfSize:12]];
        [author_name setTextAlignment:NSTextAlignmentLeft];
        author_name.textColor = RGBA(153, 153, 153);
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.bottom.equalTo(self.mas_bottom).with.offset(-5);
            make.right.equalTo(self.mas_centerX).with.offset(0);
        }];
        
        [date  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).with.offset(-10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [author_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).with.offset(-10);
            make.left.equalTo(imageView.mas_right).with.offset(5);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(5);
            make.left.equalTo(imageView.mas_right).with.offset(5);
            make.right.equalTo(self.mas_right).with.offset(-5);
            make.width.equalTo(@30);
        }];
       
    }
    return self;
}

-(void)myModel:(myModelObject *)model{
    author_name.text = model.author_name;
    title.text = model.title;
    date.text = [model.date substringFromIndex:5];//截取掉下标7之后的字符串
    NSString *url = model.imageUrl;
    //可以缓存图片
    [imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:url] placeholderImage:[[UIImage alloc] init] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        imageView.image = image;
        
    }];
    

}

@end
