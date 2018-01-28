//
//  HomeViewController.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/22.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "HomeViewController.h"
#import "JSHVisitMenuView.h"
#import "HomeCollectionViewCell.h"
#import "BTCSearchViewController.h"
#import "HomeHeaderView.h"
@interface HomeViewController ()<UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,BaseHomeHeaderDelegate>{
    NSInteger _saveIndex;
    BOOL _isClickMenu;


}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

//@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) JSHVisitMenuView *menuView;
@property (nonatomic,strong) HomeHeaderView *homeHeaderView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"币行情"];
//    [self setLeftBarButtonWithImage:[UIImage imageNamed:@"搜索"] size: CGSizeMake(40, 25)];
//    [self.view NightWithType:UIViewColorTypeNormal];
    [self setUpUI];
    [self setMenuView];

}
#pragma mark - 初始化View
- (void)setUpUI {
    
    
    
    self.homeHeaderView = [[HomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self.homeHeaderView.delegate = self;
    [self setnavigationView:self.homeHeaderView];
    

    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 1;

    _collectionView.collectionViewLayout = layout;
    _collectionView.pagingEnabled = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCollectionViewCell"];
    [self.view addSubview:_collectionView];
    
}
- (void)leftBarButtonTouchUpInside:(id)sender {
    BTCSearchViewController *con = [[BTCSearchViewController alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}
-(void)setMenuView{
    
    _menuView = [[JSHVisitMenuView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
//    _menuView.backgroundColor = [UIColor clearColor];
    [_menuView NightWithType:UIViewColorTypeNormal];
    _menuView.unSelectedtextColor = [UIColor colorFromHexString:@"#999999"];
    
    //菜单栏标题
    _menuView.titleItems = @[@"市值",@"涨幅",@"OkEx",@"币安",@"Gate.io",@"Bittrex",@"Bitfinex",@"HitBTC",@"火币Pro",@"EtherDelta",@"Liqui"];
    _menuView.selectedIndex = 0;
    [self.view addSubview: _menuView];
    __weak __typeof(self) weakSelf = self;
    [_menuView setMenuViewDidSelectedAtIndex:^(NSInteger index) {
        _isClickMenu = YES;
     [weakSelf.collectionView setContentOffset:CGPointMake(index*weakSelf.collectionView.frame.size.width,0) animated:NO];
    }];
}
#pragma mark - homeHeaderView
- (void)didSearchWithContent:(HomeHeaderView *)view  btn:(UIButton *)sender{
    switch (sender.tag) {
        case 1000:{
                
            }
            break;
        case 1001:{
            
        }
            break;
        case 1002:{
            
        }
            break;
            
        default:
            break;
    }
}
- (void)didSearchWithContent:(HomeHeaderView *)view segmentController:(UISegmentedControl *)sender {
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 11;
}

#pragma mark - UICollectionViewDelegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    if (!cell.viewController) {
        cell.viewController = self;
    }
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(SCREEN_WIDTH, self.collectionView.frame.size.height);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat rate = scrollView.contentOffset.x/SCREEN_WIDTH;
    NSLog(@"%zd--%zd--%f",_saveIndex,(int)rate,rate);
    if (_saveIndex - (int)rate < 0) {
        _saveIndex = (int)rate;
        [self.menuView lineDidScroll:_saveIndex];
    }else if (_saveIndex - (int)rate > 0){
        _saveIndex = (int)rate;
        if (_isClickMenu) {
            _isClickMenu = NO;
            [self.menuView lineDidScroll:(int)rate];
        }else{
            [self.menuView lineDidScroll:(int)rate+1];
        }
    }else{
        [self.menuView lineDidScroll:rate];
        
    }
    if ((rate - (int)rate) == 0) {
        [self requestDataWithIndex:rate];
    }
}
-(void)requestDataWithIndex:(NSInteger)index{
    
    NSIndexPath * indexpath = [NSIndexPath indexPathForItem:index inSection:0];
    /**
     *   延迟0.5s：1、点击导航切换，会比willDisplayCell更早响应，导致获取cell为nil
     *            2、willDisplayCell方法响应后，立刻获取cell一样为空
     **/
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        HomeCollectionViewCell * cell = (HomeCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexpath];
        //根据标题进行请求。
        [cell requestDataWithTitleString:_menuView.titleItems[indexpath.row]];
    });
}

//#pragma mark - PropertyPayCellDelegate
//-(void)requestDataStartDelegate:(PropertyPayCell *)cell{
//    
//    [self showProgress];
//}
//
//-(void)requestDataEndDelegate:(PropertyPayCell *)cell{
//    
//    [self hideProgress];
//}
//
//-(void)payActionDelegate:(PropertyPayCell *)cell andInfo:(PropertyFeeDetailResponseModel *)info{
//    _monthStr = cell.monthStr;
//    _dTotalPayFee = cell.dTotalPayFee;
//    _lblPayFeeDesc = cell.lblPayFeeDesc;
//    [self doPropertyFeeOrderGenerater:info];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
