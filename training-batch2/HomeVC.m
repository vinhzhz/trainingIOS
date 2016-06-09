//
//  HomeVC.m
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import "HomeVC.h"
#import "LabelCell.h"
#import "TextCell.h"
#import "LabelCellData.h"
#import "LocationVC.h"

@interface HomeVC () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    
}

- (void)configData {
    
//    resignFirstResponder
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
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2){
        static NSString* cellID = @"TextCellID";
        TextCell* cell = (TextCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         cell.textCell.delegate = self;
        return cell;
    }else if(indexPath.row == 0){
        static NSString* cellID = @"LabelCellID";
        LabelCell* cell = (LabelCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[LabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        LabelCellData* cellDT = [[LabelCellData alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cellDT.Title = @"Từ Ngày :";
        [cell configCellUI:cellDT];
        return cell;
    }else{
        static NSString* cellID = @"LabelCellID";
        LabelCell* cell = (LabelCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[LabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        LabelCellData* cellDT = [[LabelCellData alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cellDT.Title = @"Đến Ngày :";
        [cell configCellUI:cellDT];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row %2){
        return 60.0f;
    }else{
        return 40.0f;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)onNext:(id)sender {
    LocationVC* locationVC = [[LocationVC alloc] init];
    locationVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:locationVC animated:YES completion:^{}];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
