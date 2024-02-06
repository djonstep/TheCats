//
//  NetworkManager.h
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import <UIKit/UIKit.h>
#import "TCSearchResult.h"

@interface NetworkManager : NSObject

+(instancetype)sharedManager;
- (NSURLSession *)backgroundSession;
- (void)searchResultWithCompletion: (void (^)(TCSearchResult *))success;

@end
