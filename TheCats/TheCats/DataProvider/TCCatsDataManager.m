//
//  TCCatsDataManager.m
//  TheCats
//
//  Created by Admin on 06.02.2024.
//

#import "TCCatsDataManager.h"
#import "TCCatModel.h"
#import "NetworkManager.h"

@interface TCCatsDataManager () {
    NSArray<TCCatModel *> *resultArray;
}

@property (nonatomic, strong) NSMutableDictionary *cashImages;

@end

@implementation TCCatsDataManager

+ (instancetype)sharedManager {
    static TCCatsDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self new];
    });
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cashImages = [NSMutableDictionary new];
    }
    return self;
}

-(void)startLoadCatsDataWithCompletion: (void (^)(BOOL))success {
    [[NetworkManager sharedManager] searchResultWithCompletion:^(TCSearchResult *result) {
        self->resultArray = result.cat_objects;
        success(true);
    }];
}

- (NSInteger)numberOfresultSearch {
    return [resultArray count];
}

- (TCCatModel *)searchCatWithIndex:(NSInteger)index {
    return resultArray[index];
}

- (void)cashCatImage:(NSString *)cat_id image:(UIImage *)image {
    self.cashImages[cat_id] = image;
}

- (UIImage *)getCatImage:(NSString *)cat_id {
    UIImage *image = self.cashImages[cat_id];
    return image;
}

@end
