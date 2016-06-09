//
//  LabelCell.h
//  training-batch2
//
//  Created by VinhHV on 6/9/16.
//  Copyright © 2016 VinhHV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelCellData.h"

@interface LabelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Title;
- (void)configCellUI:(LabelCellData*)cellData;
@end
