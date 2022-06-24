//
//  XXXSHAViewController.m
//  7878
//
//  Created by XFDH on 2022/6/24.
//

#import "XXXSHAViewController.h"
#define SIZE [UIScreen mainScreen].bounds

@interface XXXSHAViewController () {
    UIView *_chooseContent;
}

@property (nonatomic,strong) UIView *tableView;

@end

@implementation XXXSHAViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    
    CGFloat width = SIZE.size.width;
    CGFloat height = SIZE.size.height;
    self.tableView = [[UIView alloc]init];
    self.tableView.backgroundColor = UIColor.brownColor;
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(10, 10, width-20, height-20);

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationDidChange)
                         name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    
    _chooseContent = [[UIView alloc]init];
    _chooseContent.backgroundColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0];
    _chooseContent.layer.backgroundColor = [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1.0].CGColor;
    _chooseContent.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.12].CGColor;
    _chooseContent.layer.shadowOffset = CGSizeMake(0,0);
    _chooseContent.layer.shadowOpacity = 1;
    _chooseContent.layer.shadowRadius = 3;
    _chooseContent.layer.cornerRadius = 3;
    [self.view addSubview:_chooseContent];
    _chooseContent.frame = CGRectMake(CGRectGetMidX(self.view.frame) -  50, 100, 100, 100);

}

- (BOOL)onDeviceOrientationDidChange {
    
    UIDevice *device = [UIDevice currentDevice];
    switch (device.orientation) {
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左橫置");
            self.tableView.frame = CGRectMake(10, 10, SIZE.size.width-20, SIZE.size.height-20);
            _chooseContent.frame = CGRectMake(100, CGRectGetMidY(self.view.frame) - 50, 100, 100);
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            self.tableView.frame = CGRectMake(10, 10, SIZE.size.width-20, SIZE.size.height-20);
            _chooseContent.frame = CGRectMake(SIZE.size.width - 200, CGRectGetMidY(self.view.frame) - 50, 100, 100);
            break;
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            self.tableView.frame = CGRectMake(10, 10, SIZE.size.width-20, SIZE.size.height-20);
            _chooseContent.frame = CGRectMake((SIZE.size.width - 100)/2, 100, 100, 100);
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            //从右边旋转过来的 起点坐标在右上角 X坐标从上往下递增 Y坐标从右往左递增
            //从左边旋转过来的 起点坐标在左下角 X坐标从下往上递增 Y坐标从左往右递增
            _chooseContent.frame = CGRectMake(100, 137.5, 100, 100);
            break;
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕幕朝上平躺");
            break;
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
        default:
            NSLog(@"無法识别");
            break;
    }
    return YES;
}

//旋转方向发生改变时
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    NSLog(@"p1g %ld",(long)toInterfaceOrientation);
}

//视图旋转之前自动调用 将要旋转到目标方向
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    NSLog(@"p2g %ld",(long)toInterfaceOrientation);
}

//视图旋转完成之后自动调用
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    NSLog(@"p3g %ld",(long)fromInterfaceOrientation);
}


//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event： 用来判断触摸点是否在控件上
//
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event： 用来判断控件是否接受事件以及找到最合适的view
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
