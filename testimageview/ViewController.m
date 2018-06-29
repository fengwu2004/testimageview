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
  
  NSLog(@"viewDidLoad %p", _tableView);
  
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
  
  NSString *url = [NSString stringWithFormat:@"http://123.206.230.152/images/%ld", row + 1];
  
  [cell imageWithUrl:url withIndex:row + 1];

  return cell;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  
  NSLog(@"initWithCoder");
  
  self = [super initWithCoder:aDecoder];
  
  return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  
  NSLog(@"initWithNibName");
  
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  
  return self;
}

- (void)awakeFromNib {
  
  [super awakeFromNib];
  
  NSLog(@"awakeFromNib");
}

- (void)loadView {
  
  [super loadView];
  
  NSLog(@"loadView %p", _tableView);
}

- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:animated];
  
  NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
  
  [super viewDidAppear:animated];
  
  NSLog(@"viewDidAppear");
}

- (void)viewDidLayoutSubviews {
  
  [super viewDidLayoutSubviews];
  
  NSLog(@"viewDidLayoutSubviews");
}

- (void)viewWillDisappear:(BOOL)animated {
  
  [super viewWillDisappear:animated];
  
  NSLog(@"viewWillAppear");
}

- (void)viewDidDisappear:(BOOL)animated {
  
  [super viewDidDisappear:animated];
  
  NSLog(@"viewWillDisappear");
}



@end
