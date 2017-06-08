//
//  DivCollectionLayout.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 08/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DivCollectionLayoutDelegate <NSObject>

/*
 Delegat Method to get cell height for each cell
 */

@required

-(CGFloat)collectionView:(UICollectionView *)collectionView heightForIndexPath:(NSIndexPath *)indexPath ofWidth:(CGFloat)width;

@end

@interface DivCollectionLayout : UICollectionViewLayout

@property(weak,nonatomic) id<DivCollectionLayoutDelegate> delegate;

/*
    Array to hold UICollectionViewLayoutAttribute data for each cell
 */

@property(strong,nonatomic) NSMutableArray *arrLayoutAttribute;

@end
