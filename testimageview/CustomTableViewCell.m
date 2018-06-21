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

- (void)setImage:(NSString*)fileName {
  
  [_myimageView setImage:[UIImage imageNamed:fileName]];
}

- (void)image:(UIImage*)image {
  
  [_myimageView setImage:image];
}

- (void)imageWithUrl:(NSString*)urlpath {
  
  if (!urlpath) {
    
    return;
  }
  
  NSURL *url = [NSURL URLWithString:urlpath];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    dispatch_async(dispatch_get_main_queue(), ^{
      
      NSLog(@"下载完毕%@", urlpath);
      
      [self.myimageView setImage:[UIImage imageWithData:data]];
    });
  }];
  
  [task resume];
}

@end
