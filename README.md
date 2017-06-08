# H1 DivAsyncImageLoad

This project consist 2 custom classes that can be integrated in any iOS Project.

# H3 DivAsyncImageLoad

# H3Div Custom Collection Layout


# H3UIImageView+DivAsyncImageLoad

This is a imageview category which use DivAsync Download class to download and cache images. There are 3 Method which can be
used to download images from remote url

# H4-(void)setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder;

# H4-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder;

# H4-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder successHandler:(SuccessHandler)successBlock failureHandler:(FailureHandler)failureBlock;


If you want to cancel image download task then call this method

# H4-(void)cancelImageDownloadForUrl:(NSURL *)url;


# H3DivAsynDownload

This class use NSUrlSession to download remote url data and cache it with the help of DivCache Class. If same request make again
then this class hold that request in dictionary to respond later when previous request response come to avoid duplicate requests.

# H4-(void)createDownloadTaskForRequest:(NSURLRequest *)request With:(CompletionHandler)completionHandler;

# H4-(void)cancelDownloadTaskForUrl:(NSURL *)url;


# H3DivCollectionLayout

This is a custom collection layout same as pinterest collection layout which sets collection view cell position and size dynamically
in collection view.

To use this:
create a instace of this class

    DivCollectionLayout *divyanshuCustomLayout = [DivCollectionLayout new];
    
assign delegate

    divyanshuCustomLayout.delegate = self;
    
then add this class as collection view layout
    
    self.clViewImages.collectionViewLayout = divyanshuCustomLayout;
    
