//
//  ViewController.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+DivAsyncImageLoad.h"
#import "DivAsyncDownload.h"
#import "UserPosts.h"
#import "DivCollectionLayout.h"

#define WebserviceUrl @"http://pastebin.com/raw/wgkJgazE"

@interface ViewController ()<DivCollectionLayoutDelegate>

@property(strong,nonatomic) UIRefreshControl *refreshControl;

/*
    Array to hold webservice data
 */

@property(strong,nonatomic) NSMutableArray *arrPosts;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRefreshControlInCollectionView];
    
    [self loadImageData];
    
    self.arrPosts = [NSMutableArray new];
    
    /*
     Setting My Custom Collection Layout For Collection View
     */
    
    DivCollectionLayout *divyanshuCustomLayout = [DivCollectionLayout new];
    
    divyanshuCustomLayout.delegate = self;
    
    self.clViewImages.collectionViewLayout = divyanshuCustomLayout;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- CollectionView Delegates/DataSources

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.arrPosts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UserPosts *post = self.arrPosts[indexPath.item];
    
    UIImageView *imgPost = (UIImageView *)[cell viewWithTag:101];
    
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)[cell viewWithTag:102];
    
    [indicator startAnimating];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:post.image];
    
    [imgPost setImageWithRequest:request placeHolder:nil successHandler:^(UIImage *image, NSURLResponse *response) {
        
        [indicator stopAnimating];
        
    } failureHandler:^(NSError *error, NSURLResponse *response) {
        
        NSLog(@"Unable to load image for index item : %d",indexPath.item);
        
    }];
    
    return cell;
    
}

-(CGFloat)collectionView:(UICollectionView *)collectionView heightForIndexPath:(NSIndexPath *)indexPath ofWidth:(CGFloat)width{
    
    UserPosts *post = self.arrPosts[indexPath.item];
    
    return width * post.height/post.width;
    
}

-(void)collectionViewWillRefreshed {
    
    [self.arrPosts removeAllObjects];

    _clViewImages.userInteractionEnabled = false;
    
    [self loadImageData];
    
}


#pragma mark - Webservice Methods

-(void)loadImageData {
    
    [self.actIndicatorView startAnimating];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:WebserviceUrl]];
    
    [[DivAsyncDownload sharedInstance] createDownloadTaskForRequest:request With:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        [self.actIndicatorView stopAnimating];
        
        [_refreshControl endRefreshing];
        
        _clViewImages.userInteractionEnabled = true;
       
        if(!error){
            
            NSError *parseError;
            
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&parseError];
            
            if(!parseError){
                
                NSLog(@"%@",result);
                
                //expected result is array of image posts from this url
                
                if([result isKindOfClass:[NSArray class]]){
                    
                    // initialising UserPosts data model from json response
                
                    for(NSDictionary *dictPostInfo in result) {
                        
                        [self.arrPosts addObject:[[UserPosts alloc] initWithDictionary:dictPostInfo]];
                        
                    }
                    
                    [self.clViewImages reloadData];
                
                }
                
                
            }
            else{
                
                NSLog(@"%@",parseError.localizedDescription);
            }
            
        }
        else{
            
            NSLog(@"%@",error.localizedDescription);
            
        }
        
        
    }];
    
}

#pragma mark - Helper Methods

-(void)addRefreshControlInCollectionView {
    
    _refreshControl = [UIRefreshControl new];
    
    [_refreshControl addTarget:self action:@selector(collectionViewWillRefreshed) forControlEvents:UIControlEventValueChanged];
    
    _clViewImages.alwaysBounceVertical = true;
    
    [_clViewImages addSubview:_refreshControl];
    
}

@end
