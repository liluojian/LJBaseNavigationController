//
//  IndexVC.m
//  ExampleDemo
//
//  Created by 李罗坚 on 2020/5/21.
//  Copyright © 2020 李罗坚. All rights reserved.
//

#import "IndexVC.h"
#import "UINavigationController+LJNavigation.h"
@interface IndexVC ()
@property (weak, nonatomic) IBOutlet UIButton *reBtn;
@end

@implementation IndexVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.reBtn setTitle:[NSString stringWithFormat:@"页面%ld,页面4监控了侧滑和返回按钮",self.indexNum] forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    __weak typeof(self) wself = self;
    if(self.indexNum == 4){
        self.navigationController.navBack = ^{
            [wself.navigationController popToRootViewControllerAnimated:YES];
        };
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(self.indexNum == 4){
        self.navigationController.navBack = nil;
    }
}

#pragma mark - user Actions
- (IBAction)reBtnAction:(UIButton *)sender {
    IndexVC *vc = [[IndexVC alloc] init];
    vc.indexNum = self.indexNum + 1;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dealloc{
    NSLog(@"页面%ld销毁",self.indexNum);
}
@end
