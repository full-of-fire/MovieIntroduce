//
//  YJLineLayout.h
//  影片信息展示-Demo
//
//  Created by yangjie on 16/1/9.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define YJItemSpace 10 //item的间距
#define YJItemH 110 // 图片的高度
#define YJItemW 70  // 图片的宽度
#define YJActiveDistance (YJItemW+YJItemSpace) // 图片被放大的距离
#define YJScale 1.1 // 图片被放大的倍数


@interface YJLineLayout : UICollectionViewFlowLayout

@end
