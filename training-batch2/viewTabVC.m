//
//  viewTabVC.m
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import "viewTabVC.h"
#import "HomeVC.h"
#import "HistoryVC.h"

@interface viewTabVC ()
@property (weak, nonatomic) IBOutlet UIView *viewData;
@property (weak, nonatomic) IBOutlet UIButton *btnBook;
@property (weak, nonatomic) IBOutlet UIButton *btnHistory;
@property (nonatomic, strong) NSArray* arrayContentViews;

@end

@implementation viewTabVC


- (void)viewDidLoad {
    [super viewDidLoad];
    HomeVC *homeVC = [[HomeVC alloc] init];
    HistoryVC *historyVC = [[HistoryVC alloc] init];
    self.arrayContentViews = @[homeVC,historyVC];
    [self onBook: self.btnBook];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onBook:(UIButton *)sender {
    self.btnHistory.selected = NO;
    sender.selected = YES;
    [self tabSelected:sender];
}
- (IBAction)onHistory:(UIButton *)sender {
    self.btnBook.selected = NO;
    sender.selected = YES;
    [self tabSelected:sender];
}

- (void) tabSelected:(UIButton*)btnTab {
    UIViewController *vc = [self.arrayContentViews objectAtIndex:btnTab.tag];
    if (vc.isViewLoaded && vc.view.window) {
        //is visible
    }
    else {
        [self addContentVew:vc];
    }
}
- (void) addContentVew:(UIViewController*) viewController {
    for (UIViewController *subView in self.childViewControllers) {
        [subView willMoveToParentViewController:nil];
        [subView.view removeFromSuperview];
        [subView removeFromParentViewController];
    }
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
    viewController.view.frame = self.viewData.bounds;
    [self.viewData addSubview:viewController.view];
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
