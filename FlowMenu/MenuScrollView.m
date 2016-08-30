//
//  MenuScrollView.m
//  FlowMenu
//
//  Created by leewentao on 16/7/5.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "MenuScrollView.h"

const CGFloat margin = 40;

@interface MenuScrollView ()

@property (nonatomic,assign) NSUInteger selectedTag;

@end

@implementation MenuScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = YES;
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}

/**
 *  <#Description#>
 *
 *  @param menuItemArray <#menuItemArray description#>
 */
- (void)setMenuItemArray:(NSArray *)menuItemArray
{
    _menuItemArray = menuItemArray;
    NSUInteger itemCount = menuItemArray.count;
    CGFloat contentWidth = 0;
    for (NSUInteger i = 0; i < itemCount; i++) {
        UIButton *btn =[[UIButton alloc] init];
        btn.titleLabel.text = (NSString *)menuItemArray[i];
        [btn setTitle:(NSString *)menuItemArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.tag = i;
        btn.selected = (i==0);
        [btn addTarget:self action:@selector(menuSeleted:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        contentWidth += [MenuScrollView widthWithTitle:(NSString *)menuItemArray[i]] + margin;
    }
    self.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width , 40);
    self.contentSize = CGSizeMake(contentWidth, self.frame.size.height);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSArray *subviews = self.subviews;
    for (NSUInteger i = 0, count = subviews.count; i < count; i++) {
        UIView *item = (UIView *)subviews[i];
        CGFloat itemX = 0.0f;
        if (i>0) {
            UIView *frontitem = (UIView *)subviews[i-1];
            itemX = CGRectGetMaxX(frontitem.frame);
        }
        CGFloat itemWidth = [MenuScrollView widthWithTitle:self.menuItemArray[i]];
        item.frame = CGRectMake(itemX, 0, itemWidth+margin, self.frame.size.height);
    }
}

+ (CGFloat)widthWithTitle:(NSString *)title
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:10.0f];
    return [title sizeWithAttributes:attributes].width;
}

- (void)menuSeleted:(id)sender
{
    const CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat contentWidth = self.contentSize.width;
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag==self.selectedTag) {
        return;
    }
    UIButton *seletedbtn = (UIButton *)self.subviews[self.selectedTag];
    seletedbtn.selected = false;
    self.selectedTag = btn.tag;
    btn.selected = true;
    CGFloat btnCenterX = btn.center.x;
    CGFloat contentOffsetX;
    if (btnCenterX < screenWidth/2) {
        contentOffsetX = 0;
    }else if (btnCenterX+screenWidth/2 < contentWidth){
        contentOffsetX = btnCenterX - screenWidth/2;
    }else{
        contentOffsetX = contentWidth - screenWidth;
    }
    [self setContentOffset:CGPointMake(contentOffsetX, 0) animated:YES] ;
}



@end
