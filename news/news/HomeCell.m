//
//  HomeCell.m
//  news
//
//  Created by 李世爽 on 16/7/2.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "HomeCell.h"
#define LINERGBA [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]
@implementation HomeCell
{
    UILabel *label1;
    UILabel *label2;
    UIButton *leftButton;
    UIButton *rightButton;
    UIView *line1;
    UIView *line2;
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
        label1 = [[UILabel alloc] init];
        label2 = [[UILabel alloc] init];
        label1.font = [UIFont systemFontOfSize:12];
        label2.font = [UIFont systemFontOfSize:12];
        leftButton = [[UIButton alloc] init];
        rightButton = [[UIButton alloc] init];
        [leftButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        line1 = [[UIView alloc] init];
        line2 = [[UIView alloc] init];
        [line1 setBackgroundColor:LINERGBA];
        [line2 setBackgroundColor:LINERGBA];
        
        [self addSubview:label1];
        [self addSubview:label2];
        [self addSubview:line2];
        [self addSubview:line1];
        
        
        [line1  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(5);
            make.bottom.equalTo(self.mas_bottom).with.offset(-5);
            make.centerX.equalTo(self.mas_centerX);
            make.width.equalTo(@1.0);
        }];
        
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.left.equalTo(self).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(self.mas_bottom).with.offset(-2);
            make.height.equalTo(@1.0);
        }];
        [self addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(5);
            make.right.equalTo(line1).with.offset(-5);
            make.bottom.equalTo(self.mas_bottom).with.offset(-20);
            
        }];
        [self addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(line1).with.offset(5);
            make.right.equalTo(self.mas_right).with.offset(-5);
            make.bottom.equalTo(self.mas_bottom).with.offset(-20);
        }];


        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(leftButton.mas_centerX);
            make.top.equalTo(leftButton.mas_bottom).with.offset(3);
            make.height.equalTo(@8);
        }];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(rightButton.mas_centerX);
            make.top.equalTo(rightButton.mas_bottom).with.offset(3);
            make.height.equalTo(@8);
        }];
        
                
    }
    return self;
}




-(void)cellIndex :(NSInteger) index{
    leftButton.tag = index*2;
    rightButton.tag = index*2 +1;
    switch (index) {
        case 0:
            label2.text = @"头条";
            label1.text = @"社会";
            [leftButton setBackgroundImage:[UIImage imageNamed:@"toutiao.png"] forState:UIControlStateNormal];
            [rightButton setBackgroundImage:[UIImage imageNamed:@"shehui.png"] forState:UIControlStateNormal];
            break;
        case 1:
            label2.text = @"娱乐";
            label1.text = @"科技";
            [leftButton setBackgroundImage:[UIImage imageNamed:@"yule.png"] forState:UIControlStateNormal];
            [rightButton setBackgroundImage:[UIImage imageNamed:@"keji.png"] forState:UIControlStateNormal];

            break;
        case 2:
            label2.text = @"军事";
            label1.text = @"财经";
            [leftButton setBackgroundImage:[UIImage imageNamed:@"junshi.png"] forState:UIControlStateNormal];
            [rightButton setBackgroundImage:[UIImage imageNamed:@"caijing.png"] forState:UIControlStateNormal];
            break;
        case 3:
            label2.text = @"国内";
            label1.text = @"国外";
            [leftButton setBackgroundImage:[UIImage imageNamed:@"guonei.png"] forState:UIControlStateNormal];
            [rightButton setBackgroundImage:[UIImage imageNamed:@"guoji.png"] forState:UIControlStateNormal];
            break;
        case 4:
            label2.text = @"时尚";
            label1.text = @"体育";
            [leftButton setBackgroundImage:[UIImage imageNamed:@"shishang.png"] forState:UIControlStateNormal];
            [rightButton setBackgroundImage:[UIImage imageNamed:@"tiyu.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}



-(void)buttonClicked:(id)sender{
    NSLog(@"到这了吗？");
    if (_delegate && [_delegate respondsToSelector:@selector(buttonRespond:)] ) {
        [_delegate buttonRespond:sender];
    }

}

@end
