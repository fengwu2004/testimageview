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
@property(weak) IBOutlet UILabel *mytextLabel;
@property(nonatomic) dispatch_block_t imagedownloadblock;
@property(nonatomic) NSInteger myIndex;

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

- (void)fileWithUrl:(NSURL *)fileurl withIndex:(NSInteger)myIndex {
  
  dispatch_block_t block = ^(void){
    
    NSLog(@"下载%ld", myIndex);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:fileurl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
      if (error) {
        
        return;
      }
    
      if (myIndex != self.myIndex) {
        
        NSLog(@"取消");
        
        return;
      }
      
      dispatch_async(dispatch_get_main_queue(), ^{
        
        UIImage *image = [UIImage imageWithData:data];
    
        [self.myimageView setImage:image];
      });
    }];
    
    [task resume];
  };

  _imagedownloadblock = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  
  dispatch_time_t t = dispatch_time(0, NSEC_PER_SEC * 0.1);
  
  dispatch_after(t, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), _imagedownloadblock);
}

- (void)imageWithUrl:(NSString*)urlpath withIndex:(NSInteger)myIndex {
  
  if (!urlpath) {
    
    return;
  }
  
  NSURL *jpgurl = [NSURL URLWithString:[NSString stringWithFormat:@"%@.png", urlpath]];
  
  _myIndex = myIndex;
  
  [self fileWithUrl:jpgurl withIndex:myIndex];
  
  [_mytextLabel setText:[NSString stringWithFormat:@"%ld", myIndex]];
}

- (void)prepareForReuse {
  
  [super prepareForReuse];
  
  if (_imagedownloadblock) {

    dispatch_cancel(_imagedownloadblock);
  }
}
@end
