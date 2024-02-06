//
//  TCSearchResult.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "TCSearchResult.h"

@implementation TCSearchResult

- (instancetype)initWithJSONArray:(NSArray *)json {
    self = [super init];
    
    if (self) {
        NSMutableArray *newArray = [NSMutableArray array];
        [json enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [newArray addObject: [[TCCatModel alloc] initWithJSONDictionary:obj]];
        }];
        self.cat_objects = newArray;
    }
    return self;
}

@end
