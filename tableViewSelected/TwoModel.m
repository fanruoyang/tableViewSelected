//
//  TwoModel.m
//  tableViewSelected
//
//  Created by ios on 2018/10/9.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "TwoModel.h"

@implementation TwoModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.textId = [[dict objectForKey:@"textId"]intValue];
        self.textName = [dict objectForKey:@"textName"];
        self.textContent = [dict objectForKey:@"textContent"];
        self.isShowMoreText = NO;
        
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
        NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
        CGSize size = [_textContent boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 100000) options:option attributes:attribute context:nil].size;;
        self.height=size.height;
        
        
    }
    return self;
}


@end
