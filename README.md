# FKLoadViewDemo
  /**
     * 请求缓冲框事例一
     **/
//    [FKLoadindicatorView startIndicatorView:@"测试数据" style:IndicatorViewStyleWhiteLarge];
//    [FKLoadindicatorView finishIndicatorView];
  
    
    /**
     * 请求缓冲框事例二
     * 可以类的形式调用也可以 self.view 调用
     **/
//    [FKLoadWaitView startWaitView];
//    [FKLoadWaitView finishWaitView];
    [self.view loadViewShow];
    [self.view loadViewFinish];
    
    
  由于项目上用的到,干脆自己封装下
