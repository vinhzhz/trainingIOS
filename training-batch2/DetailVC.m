//
//  DetailVC.m
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import "DetailVC.h"
#import "HistoryVC.h"
#import "LabelCell.h"
#import "TextCell.h"
#import "LabelCellData.h"

@interface DetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* tableList1;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    self.tableList1 = [[NSArray alloc] initWithObjects:@"+ Từ ngày 15-6-2016",@"+ Tới ngày 17-6-2016", @"+ Tại KS Hoàn Kiếm, Hà Nội",@"+ Giá tiền: 1’000’000VND",nil];
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cellDT.Title  = [ self.tableList1 objectAtIndex:indexPath.row];
    [cell configCellUI:cellDT];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}

- (IBAction)onBack:(UIButton *)sender {
    self.btnBack.selected = NO;
    sender.selected = YES;
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
