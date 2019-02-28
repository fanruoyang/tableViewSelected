//
//  Persent.h
//  tableViewSelected
//
//  Created by ios on 2018/12/19.
//  Copyright © 2018 ios. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PersentDelegate <NSObject>
@optional //可以实现的方法
- (void)sinceRequst:(NSString *)num indexPath:(NSIndexPath *)indexPath;
- (void)reloadUI;

@end
@interface Persent : NSObject<PersentDelegate>


@end

