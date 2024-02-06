//
//  NetworkManager.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "NetworkManager.h"

static NSString * const NMURLString = @"https://api.thecatapi.com/v1/images/search";
static NSString * const NMAPIKeyString = @"live_gbxmTn4ke7UM8N9VbUNwaJtaRuoJ9KxU2HZoyqjGxtEM8Xyazz7SP0PFP2ppjuNK";

@interface NetworkManager () <NSURLSessionDownloadDelegate> {
    NSURLSession *inProgressSession;
    NSURLSessionDownloadTask *cancellableTask;
}

@end

@implementation NetworkManager

+ (instancetype)sharedManager {
    static NetworkManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self new];
    });
    return _sharedManager;
}

- (NSURLSession *)backgroundSession {
    static NSURLSession *backgroundSession = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.thecats.backgrounddownload.backgroundsession"];
        backgroundSession = [NSURLSession sessionWithConfiguration: config delegate: self delegateQueue: nil];
    });
    return backgroundSession;
}

- (void)searchResultWithCompletion: (void (^)(TCSearchResult *))success {
    NSString *urlString = [NSString stringWithFormat:@"%@?size=med&mime_types=jpg&format=json&has_breeds=true&order=RAND&page=0&limit=10&api_key=%@", NMURLString, NMAPIKeyString];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration: config];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        NSArray *jsonObjects = (NSArray *)[NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:&jsonError];
        TCSearchResult *result = [[TCSearchResult alloc] initWithJSONArray:jsonObjects];
        success(result);
        [session finishTasksAndInvalidate];
    }];
    [task resume];
}

- (void)startDownloadImageWithUrl:(NSString *)urlString {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSURLSessionDownloadTask *backTask = [self.backgroundSession downloadTaskWithRequest:request];
    [backTask resume];
}

- (void)saveFileWithURL: (NSURL *)url completion: (void (^)(BOOL))success {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectory = [fileManager URLsForDirectory: NSDocumentDirectory inDomains: NSUserDomainMask][0];
    NSURL *destinationPath = [documentDirectory URLByAppendingPathComponent: [url lastPathComponent]];
    NSError *error;
    
    [fileManager removeItemAtURL: destinationPath error: NULL];
    BOOL result = [fileManager copyItemAtURL: url toURL: destinationPath error: &error];
    success(result);
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location { 
    [self saveFileWithURL:location completion:^(BOOL success) {
        NSLog(@"Save");
    }];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
}

@end
