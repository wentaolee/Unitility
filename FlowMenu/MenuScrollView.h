//
//  MenuScrollView.h
//  FlowMenu
//
//  Created by leewentao on 16/7/5.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuScrollViewDelegate <NSObject>

- (void)selectedMenuItem:(NSUInteger)item;

@end

@interface MenuScrollView : UIScrollView

@property (nonatomic,strong) NSArray *menuItemArray;

@property (nonatomic,weak) id<MenuScrollViewDelegate> menuDelegate;

@end
