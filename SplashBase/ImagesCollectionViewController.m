//
//  ImagesCollectionViewController.m
//  SplashBase
//
//  Created by Benno Krauss on 13/07/14.
//  Copyright (c) 2014 Benno Krauss. All rights reserved.
//

#import "ImagesCollectionViewController.h"
#import "SplashBaseAPI.h"
#import "SBImageCell.h"
#import "MHFacebookImageViewer.h"

@interface ImagesCollectionViewController () <MHFacebookImageViewerDatasource>
@property NSArray *images;
@end

static NSString *cellIdentifier = @"ImageCell";

@implementation ImagesCollectionViewController

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    if (self = [super initWithCollectionViewLayout:layout])
    {
        CGFloat halfSize = self.view.frame.size.width / 2;
        
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.itemSize = CGSizeMake(halfSize,halfSize);
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    [self.collectionView registerClass:SBImageCell.class forCellWithReuseIdentifier:cellIdentifier];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView setContentInset:UIEdgeInsetsMake(UIApplication.sharedApplication.statusBarFrame.size.height, 0, 0, 0)];
    
    [SplashBaseAPI getMostRecentImagesURLsWithCompletionHandler:^(NSError *error, NSArray *images) {
        self.images = images;
        [self.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBImageCell *cell = (SBImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell configureWithImage:self.images[indexPath.row]];
    [cell.imageView setupImageViewerWithDatasource:self initialIndex:indexPath.row onOpen:nil onClose:nil];
    
    return cell;
}

#pragma mark image view data source

- (NSInteger) numberImagesForImageViewer:(MHFacebookImageViewer*) imageViewer
{
    return self.images.count;
}

- (NSURL*) imageURLAtIndex:(NSInteger)index imageViewer:(MHFacebookImageViewer*) imageViewer
{
    return [(SBImageInfo *)self.images[index] url];
}


- (UIImage*) imageDefaultAtIndex:(NSInteger)index imageViewer:(MHFacebookImageViewer*) imageViewer
{
    return nil;
}

#pragma mark view controller style stuff

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
