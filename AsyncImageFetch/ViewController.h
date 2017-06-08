//
//  ViewController.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(weak,nonatomic) IBOutlet UICollectionView *clViewImages;

@property(weak,nonatomic) IBOutlet UIActivityIndicatorView *actIndicatorView;

@end

