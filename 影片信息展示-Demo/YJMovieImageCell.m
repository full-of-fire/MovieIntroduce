//
//  YJMovieImageCell.m
//  影片信息展示-Demo
//
//  Created by yangjie on 16/1/9.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import "YJMovieImageCell.h"

@implementation YJMovieImageCell

- (void)awakeFromNib {
   
    self.movieImageView.layer.borderWidth = 3;
    self.movieImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.movieImageView.layer.cornerRadius = 3;
    self.movieImageView.clipsToBounds = YES;
    
}

@end
