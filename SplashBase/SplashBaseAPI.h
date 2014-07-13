//
//  SplashBaseAPI.h
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SplashBaseAPI : NSObject
/*
 Returns an array of SBImageInfo model objects holding info from the 10 most recent images.
*/
+ (void)getMostRecentImagesURLsWithCompletionHandler:(void (^) (NSError *error, NSArray *images))completionHandler;
@end
