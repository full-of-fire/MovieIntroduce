//
//  ViewController.m
//  影片信息展示-Demo
//
//  Created by yangjie on 16/1/9.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import "ViewController.h"
#import "YJMovieImageCell.h"
#import "YJLineLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *images; // 图片数组

@property (nonatomic,strong) NSMutableArray *colors; // 颜色数组

@end
static NSString *reuseID = @"YJMovieImageCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self crateCollectionView];
    
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.images.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    YJMovieImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    cell.movieImageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    
    return cell ;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%ld",(long)indexPath.row);
    // 被点击的时候要切换到屏幕中间，变化背景颜色，切换数据都在这里
    
    [self.collectionView scrollRectToVisible:CGRectMake(YJActiveDistance*indexPath.row, 0, ScreenWidth, 130) animated:YES];
    
    
    self.collectionView.backgroundColor = self.colors[indexPath.row];
    
   
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    // 停止滚动的时中间图片的index
    NSUInteger row = scrollView.contentOffset.x / YJActiveDistance;
    
    NSLog(@"%lu",row);
    
    self.collectionView.backgroundColor = self.colors[row];
}



#pragma mark - 私有方法
- (void)crateCollectionView{

    //1.首先创建一个布局
    YJLineLayout *lineLayout = [[YJLineLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 130) collectionViewLayout:lineLayout];
    
    
    //注册cell(必须先注册)
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YJMovieImageCell class]) bundle:nil] forCellWithReuseIdentifier:reuseID];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    _collectionView.backgroundColor = self.colors[0];
    
    [self.view addSubview:_collectionView];
}


#pragma mark - get方法
- (NSMutableArray*)images
{
    
    if(_images==nil){
        
        _images = [NSMutableArray array];
        
        for (int i = 0; i<20; i++) {
            
            NSString *str = [NSString stringWithFormat:@"%d",i+1];
            
            [_images addObject:str];
        }
    }
    return _images;
}

- (NSMutableArray*)colors
{
    
    if(_colors==nil){
        
        _colors = [NSMutableArray array];
        
        // 随机色
        for (int i = 0; i<20; i++) {
            
            CGFloat r = arc4random()%256/255.0;
            CGFloat g = arc4random()%256/255.0;
            CGFloat b = arc4random()%256/255.0;
            UIColor *randomColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
            
            [_colors addObject:randomColor];
        }
       
    }
    return _colors;
}

@end
