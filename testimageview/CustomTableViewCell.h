//
//  CustomTableViewCell.h
//  testimageview
//
//  Created by ky on 2018/6/20.
//  Copyright © 2018 yellfun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

- (void)setImage:(NSString*)fileName;

- (void)image:(UIImage*)image;

- (void)imageWithUrl:(NSString*)urlpath withIndex:(NSInteger)myIndex;

- (void)pngWithUrl:(NSString*)url;

- (void)jpegWithUrl:(NSString*)url;

@end
