//
//  TCCatModel.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "TCCatModel.h"

@implementation TCCatModel

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
    return [self initResultWithImageId:dict[@"id"] withImageUrl:dict[@"url"] withBreeddict:dict[@"breeds"][0]];
}

- (instancetype)initResultWithImageId:(NSString *)image_id withImageUrl:(NSString *)imageUrl withBreeddict:(NSDictionary *)breed {
    self = [super init];

    if (self) {
        self.object_id = image_id;
        self.imageUrl = imageUrl;
        self.breed = [[TCBreedModel alloc] initWithJSONDictionary:breed];
    }
    return self;
}

@end
