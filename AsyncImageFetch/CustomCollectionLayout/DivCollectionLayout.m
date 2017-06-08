//
//  DivCollectionLayout.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 08/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "DivCollectionLayout.h"

@interface DivCollectionLayout ()

/*
 Content Height Of Collection View
 */

@property(nonatomic) CGFloat contentHeight;

@end

@implementation DivCollectionLayout

-(instancetype)init{
    
    self = [super init];
    
    if(self){
        _contentHeight = 0.0;
        
        self.arrLayoutAttribute = [NSMutableArray new];
        
    }
    
    return self;
}


-(void)prepareLayout{
    
    if(self.arrLayoutAttribute.count == 0){
        
        CGFloat collectionViewWidth = [UIScreen mainScreen].bounds.size.width-16;
        
        CGFloat coloumWidth = collectionViewWidth/2;
        
        CGFloat cellPadding = 2.0;
        
        int column = 0;
        
        NSArray *arrXOffset = @[@(0),@(coloumWidth)];
        
        NSMutableArray *arrYOffset = [[NSMutableArray alloc] initWithArray:@[@(0),@(0)]];
        
        for(int item=0;item<[self.collectionView numberOfItemsInSection:0];item++){
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            CGFloat widht = coloumWidth - cellPadding*2;
            
            CGFloat height = [self.delegate collectionView:self.collectionView heightForIndexPath:indexPath ofWidth:widht] + cellPadding*2;
            
            CGRect frame = CGRectMake([arrXOffset[column] floatValue], [arrYOffset[column] floatValue], widht, height);
            
            
            CGRect insetFrame = CGRectInset(frame, cellPadding, cellPadding);
            
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            attributes.frame = insetFrame;
            
            [self.arrLayoutAttribute addObject:attributes];
            
            _contentHeight = MAX(_contentHeight, CGRectGetMaxY(frame));
            
            arrYOffset[column] = @([arrYOffset[column] floatValue] + height);
            
            column = (column >= 1)?0:++column;
            
        }
        
        
    }
}

-(CGSize)collectionViewContentSize{
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width-16, _contentHeight);
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *arrLayoutAttributeRect = [NSMutableArray new];
    
    for(UICollectionViewLayoutAttributes *attribute in self.arrLayoutAttribute){
        
        if(CGRectIntersectsRect(attribute.frame, rect)){
            
            [arrLayoutAttributeRect addObject:attribute];
        }
    }
    
    return arrLayoutAttributeRect.copy;
}

@end
