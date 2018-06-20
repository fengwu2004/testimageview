//
//  ViewController.m
//  testimageview
//
//  Created by ky on 2018/6/20.
//  Copyright © 2018 yellfun. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property(weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

static NSString * reuseIdentifier = @"CustomTableViewCell";

- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  UINib *cellnib = [UINib nibWithNibName:@"View" bundle:nil];
  
  [_tableView registerNib:cellnib forCellReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
  
  [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
  
  NSInteger row = indexPath.row;
  
  NSString *url = [NSString stringWithFormat:@"http://123.206.230.152/images/%ld.jpeg", row + 1];
  
  NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
  
  [cell image:[UIImage imageWithData:data]];

  return cell;
}


@end
