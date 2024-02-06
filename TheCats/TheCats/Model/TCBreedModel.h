//
//  TCBreedModel.h
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import <Foundation/Foundation.h>

@interface TCBreedModel : NSObject

@property (nonatomic, strong) NSString *object_id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *temperament;
@property (nonatomic, strong) NSString *origin;
@property (nonatomic, strong) NSString *bread_description;
@property (nonatomic, strong) NSString *life_span;

-(instancetype)initWithJSONDictionary:(NSDictionary *)dict;

@end
