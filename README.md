# DivAsyncImageLoad

#### This project consist 2 custom classes that can be integrated in any iOS Project.

##### 1. DivAsyncImageLoad

##### 2. DivCustomCollectionLayout




#### UIImageView+DivAsyncImageLoad

This is a imageview category which use DivAsync Download class to download and cache images. There are 3 Method which can be
used to download images from remote url

```Objective-C
-(void)setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder;

-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder;

-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder successHandler:(SuccessHandler)successBlock failureHandler:(FailureHandler)failureBlock;
```

If you want to cancel image download task then call this method

```Objective-C
-(void)cancelImageDownloadForUrl:(NSURL *)url;
```

#### DivAsynDownload

This class use NSUrlSession to download remote url data and cache it with the help of DivCache Class. If same request make again
then this class hold that request in dictionary to respond later when previous request response come to avoid duplicate requests.

```Objective-C
-(void)createDownloadTaskForRequest:(NSURLRequest *)request With:(CompletionHandler)completionHandler;

-(void)cancelDownloadTaskForUrl:(NSURL *)url;
```

### DivCollectionLayout

This is a custom collection layout same as pinterest collection layout which sets collection view cell position and size dynamically
in collection view.

To use this:
```Objective-C
create a instace of this class

    DivCollectionLayout *divyanshuCustomLayout = [DivCollectionLayout new];
    
assign delegate

    divyanshuCustomLayout.delegate = self;
    
then add this class as collection view layout
    
    self.clViewImages.collectionViewLayout = divyanshuCustomLayout;
```

