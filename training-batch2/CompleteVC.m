//
//  CompleteVC.m
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import "CompleteVC.h"
#import "viewTabVC.h"
#import "LabelCell.h"
#import "TextCell.h"
#import "LabelCellData.h"

@interface CompleteVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UIButton *btnSend;
@property (strong,nonatomic) NSArray* tableList1;

@end

@implementation CompleteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    self.tableList1 = [[NSArray alloc] initWithObjects:@"Bạn đã thanh toán thành công hóa đơn trọ",@"+ Từ ngày 15-6-2016",@"+ Tới ngày 17-6-2016",@"+ Tại KS Hoàn Kiếm, Hà Nội",@"+ Giá tiền: 1’000’000VND", nil];
}








- (void)configData {
    
    [self configTableView];
    [self.tableView reloadData];
}
- (void)configTableView {
    [self.tableView setHidden:NO];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TextCellID"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LabelCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LabelCellID"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableList1 count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 6 || indexPath.row == 8||indexPath.row == 10){
        static NSString* cellID = @"TextCellID";
        TextCell* cell = (TextCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textCell.delegate = self;
        return cell;
    }else{
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
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row ==0){
        return 80.0f;
    }
    return 40.0f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBack:(UIButton *)sender {
    self.btnBack.selected = NO;
    sender.selected = YES;
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (IBAction)oneClose:(UIButton *)sender {
    viewTabVC* viewVC = [[viewTabVC alloc]init];
    viewVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewVC animated:YES completion:^{}];
}
- (IBAction)onSend:(UIButton *)sender {
}

@end
