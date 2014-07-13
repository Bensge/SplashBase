//
//  SBImageCell.h
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBImageInfo.h"
#import "AsyncImageView.h"

@interface SBImageCell : UICollectionViewCell
- (void)configureWithImage:(SBImageInfo *)image;
@property AsyncImageView *imageView;
@end
