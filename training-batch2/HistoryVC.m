//
//  HistoryVC.m
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import "HistoryVC.h"
#import "LabelCell.h"
#import "TextCell.h"
#import "LabelCellData.h"
#import "DetailVC.h"

@interface HistoryVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* tableList1;
@end

@implementation HistoryVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    self.tableList1 = [[NSArray alloc] initWithObjects:@"+ ngày 15-6-2016 tới 17-6-2016, KS Hoàn Kiếm, Hà Nội",@"+ ngày 18-6-2016 tới 20-6-2016, KS Rex, TP HCM", nil];
}



- (void)configData {
    
    [self configTableView];
    [self.tableView reloadData];
}
- (void)configTableView {
    [self.tableView setHidden:NO];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"LabelCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LabelCellID"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableList1 count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* CellIdentifier = @"LabelCellID";
    LabelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    LabelCellData* cellDT = [[LabelCellData alloc] init];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cellDT.Title  = [ self.tableList1 objectAtIndex:indexPath.row];
    [cell configCellUI:cellDT];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailVC* detailVC = [[DetailVC alloc] init];
    detailVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:detailVC animated:YES completion:^{}];
    
    
}

@end
