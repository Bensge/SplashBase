//
//  SBImageInfo.h
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBImageInfo : NSObject
@property int imageID;
@property (nonatomic, strong) NSURL *largeURL;
@property (nonatomic, strong) NSURL *url;
@end
