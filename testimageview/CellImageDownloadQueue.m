//
//  CellImageDownloadQueue.m
//  testimageview
//
//  Created by ky on 2018/6/29.
//  Copyright © 2018 yellfun. All rights reserved.
//

#import "CellImageDownloadQueue.h"

@interface CellImageDownloadQueue()

@property(nonatomic) dispatch_queue_t downloadqueue;

@end

@implementation CellImageDownloadQueue

- (id)init {
  
  self = [super init];
  
  dispatch_queue_attr_t attr = dispatch_queue_attr_make_initially_inactive(DISPATCH_QUEUE_CONCURRENT);
  
  attr = dispatch_queue_attr_make_with_qos_class(attr, DISPATCH_QUEUE_PRIORITY_HIGH, 0);
  
  self.downloadqueue = dispatch_queue_create("cell_image_download_ququ", attr);
  
  return self;
}

@end
