//
//  SBImageInfo.m
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import "SBImageInfo.h"

@implementation SBImageInfo
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@ %p id: %i url: %@ largeURL: %@>",NSStringFromClass(self.class),self,self.imageID,self.url,self.largeURL];
}
@end
