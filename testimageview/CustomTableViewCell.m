//
//  CustomTableViewCell.m
//  testimageview
//
//  Created by ky on 2018/6/20.
//  Copyright © 2018 yellfun. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()

@property(weak) IBOutlet UIImageView *myimageView;

@end

@implementation CustomTableViewCell

static NSInteger static_count = 0;

- (void)awakeFromNib {
  
  [super awakeFromNib];
  
  ++static_count;
  
  NSLog(@"awakeFromNib %ld", static_count);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  
  [super setSelected:selected animated:animated];
}

@end
