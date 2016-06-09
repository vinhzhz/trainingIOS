//
//  StartVC.m
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import "StartVC.h"
#import "viewTabVC.h"
#import "PayVC.h"

@interface StartVC ()
@property (weak, nonatomic) IBOutlet UIButton *btnStart;

@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated {
    viewTabVC* viewTab = [[viewTabVC alloc] init];
    viewTab.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewTab animated:YES completion:^{}];
}
- (IBAction)onStart:(UIButton *)sender {
    viewTabVC* viewTab = [[viewTabVC alloc] init];
    viewTab.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewTab animated:YES completion:^{}];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
