//
//  SBImageCell.m
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import "SBImageCell.h"
#import "MHFacebookImageViewer.h"

@interface SBImageCell ()
@property SBImageInfo *image;
@end

@implementation SBImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[AsyncImageView alloc] initWithFrame:self.contentView.bounds];
        self.imageView.showActivityIndicator = YES;
        self.imageView.activityIndicatorStyle = UIActivityIndicatorViewStyleWhite;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)configureWithImage:(SBImageInfo *)image
{
    self.image = image;
    self.imageView.imageURL = self.image.url;
}

- (CGSize)intrinsicContentSize
{
    return self.imageView.image.size;
}

@end
