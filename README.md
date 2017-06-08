# DivAsyncImageLoad

This project consist 2 custom classes that can be integrated in any iOS Project.

### DivAsyncImageLoad

### Div Custom Collection Layout


#### H3UIImageView+DivAsyncImageLoad

This is a imageview category which use DivAsync Download class to download and cache images. There are 3 Method which can be
used to download images from remote url

####-(void)setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder;

####-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder;

####-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder successHandler:(SuccessHandler)successBlock failureHandler:(FailureHandler)failureBlock;


If you want to cancel image download task then call this method

####-(void)cancelImageDownloadForUrl:(NSURL *)url;


### H3DivAsynDownload

This class use NSUrlSession to download remote url data and cache it with the help of DivCache Class. If same request make again
then this class hold that request in dictionary to respond later when previous request response come to avoid duplicate requests.

####-(void)createDownloadTaskForRequest:(NSURLRequest *)request With:(CompletionHandler)completionHandler;

####-(void)cancelDownloadTaskForUrl:(NSURL *)url;


### H3DivCollectionLayout

This is a custom collection layout same as pinterest collection layout which sets collection view cell position and size dynamically
in collection view.

To use this:
create a instace of this class

    DivCollectionLayout *divyanshuCustomLayout = [DivCollectionLayout new];
    
assign delegate

    divyanshuCustomLayout.delegate = self;
    
then add this class as collection view layout
    
    self.clViewImages.collectionViewLayout = divyanshuCustomLayout;
    
