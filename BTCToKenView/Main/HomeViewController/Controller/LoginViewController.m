//
//  LoginViewController.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/26.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "LoginViewController.h"
#import "JSHVisitMenuView.h"
#import "LoginCollectionViewCell.h"
@interface LoginViewController ()<UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>{
    NSInteger _saveIndex;
    BOOL _isClickMenu;
    
    
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) JSHVisitMenuView *menuView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setLeftBarButtonWithImage:[UIImage imageNamed:@"搜索"] size: CGSizeMake(40, 25)];
    [self.view NightWithType:UIViewColorTypeNormal];
    [self setUpUI];
    [self setMenuView];
}
#pragma mark - 初始化View
- (void)setUpUI {
    
    
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
    [self.collectionView registerNib:[UINib nibWithNibName:@"LoginCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LoginCollectionViewCell"];
    [self.view addSubview:_collectionView];
    
}
-(void)setMenuView{
    
    _menuView = [[JSHVisitMenuView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
    //    _menuView.backgroundColor = [UIColor clearColor];
    [_menuView NightWithType:UIViewColorTypeNormal];
    _menuView.unSelectedtextColor = [UIColor colorFromHexString:@"#999999"];
    
    //菜单栏标题
    _menuView.buttonWidth = SCREEN_WIDTH/2;
    _menuView.titleItems = @[@"登陆",@"注册"];
    _menuView.selectedIndex = 0;
    [self.view addSubview: _menuView];
    __weak __typeof(self) weakSelf = self;
    [_menuView setMenuViewDidSelectedAtIndex:^(NSInteger index) {
        _isClickMenu = YES;
        [weakSelf.collectionView setContentOffset:CGPointMake(index*weakSelf.collectionView.frame.size.width,0) animated:YES];
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 2;
}

#pragma mark - UICollectionViewDelegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//
    LoginCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LoginCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell.tipLabel setHidden:YES];
        [cell.xieyiBtn setHidden:YES];
        [cell.forgitBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [cell.forgitBtn setHidden:NO];
        

    } else {
        [cell.tipLabel setHidden:NO];
        [cell.xieyiBtn setHidden:NO];
        [cell.forgitBtn setTitle:@"" forState:UIControlStateNormal];
        [cell.forgitBtn setHidden:YES];
        cell.labrlheigth = 0;
        
    }
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
        
        LoginCollectionViewCell * cell = (LoginCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexpath];
       
        //根据标题进行请求。
//        [cell requestDataWithTitleString:_menuView.titleItems[indexpath.row]];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
