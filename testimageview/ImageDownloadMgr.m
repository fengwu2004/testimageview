//
//  ImageDownloadMgr.m
//  testimageview
//
//  Created by ky on 2018/6/22.
//  Copyright © 2018 yellfun. All rights reserved.
//

#import "ImageDownloadMgr.h"

@interface ImageDownloadMgr()

@property(nonatomic, strong) NSMutableDictionary *catchedImages;

@end

@implementation ImageDownloadMgr

static ImageDownloadMgr *_intance = nil;

+ (id)sharedInstance {
  
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    
    _intance = [ImageDownloadMgr new];
  });
  
  return _intance;
}

- (id)init {
  
  self = [super init];
  
  _catchedImages = [NSMutableDictionary new];
  
  return self;
}

- (void)addImage:(UIImage*)image {
  
  [_catchedImages setObject:image forKey:[NSString stringWithFormat:@"%ld", image.hash]];
}

@end
