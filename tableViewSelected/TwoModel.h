//
//  TwoModel.h
//  tableViewSelected
//
//  Created by ios on 2018/10/9.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoModel : NSObject
@property(nonatomic, assign)int       textId;
@property(nonatomic, strong)NSString  *textName;
@property(nonatomic, strong)NSString  *textContent;
///是否展开状态，默认No
@property(nonatomic, assign)BOOL      isShowMoreText;
@property (nonatomic ,assign) float  height;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
