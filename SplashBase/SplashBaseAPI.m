//
//  SplashBaseAPI.m
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import "SplashBaseAPI.h"
#import "SBImageInfo.h"

@implementation SplashBaseAPI

+ (NSURL *)urlWithPath:(NSString *)path
{
    NSString *urlString = [@"http://www.splashbase.co" stringByAppendingString:path];
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}

+ (NSArray *)imageModelsWithRawData:(NSDictionary *)data
{
    NSArray *imagesData = data[@"images"];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:imagesData.count];
    
    for (int i = 0; i < imagesData.count; i ++)
    {
        NSDictionary *rawImageInfo = imagesData[i];
        
        SBImageInfo *info = [[SBImageInfo alloc] init];
        info.imageID = [rawImageInfo[@"id"] intValue];
        info.largeURL = [NSURL URLWithString:rawImageInfo[@"large_url"]];
        info.url = [NSURL URLWithString:rawImageInfo[@"url"]];
        
        result[i] = info;
    }
    
    return result;
}

+ (void)getMostRecentImagesURLsWithCompletionHandler:(void (^) (NSError *error, NSArray *images))completionHandler
{
    NSURL *url = [self urlWithPath:@"/api/v1/images/latest"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:30];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError != nil)
        {
            completionHandler(connectionError,nil);
        }
        else {
            NSError *jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError != nil)
            {
                completionHandler(jsonError,nil);
            }
            else {
                NSArray *images = [self imageModelsWithRawData:dict];
                completionHandler(nil,images);
            }
        }
    }];
}
@end
