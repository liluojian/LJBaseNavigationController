# LJBaseNavigationController
自定义导航栏、测滑返回监控
以下代码成对出现
```
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    __weak typeof(self) wself = self;
    self.navigationController.navBack = ^{
            [wself.navigationController popToRootViewControllerAnimated:YES];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navBack = nil;
}
```
