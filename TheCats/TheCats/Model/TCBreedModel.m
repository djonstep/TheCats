//
//  TCBreedModel.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "TCBreedModel.h"

@implementation TCBreedModel

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
    self = [super init];

    if (self) {
        self.object_id = dict[@"id"];
        self.name = dict[@"name"];
        self.origin = dict[@"origin"];
        self.bread_description = dict[@"description"];
        self.life_span = dict[@"life_span"];
        self.temperament = dict[@"temperament"];
    }
    return self;
}

@end
