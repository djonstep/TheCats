//
//  TCCatModel.h
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import <Foundation/Foundation.h>
#import "TCBreedModel.h"

@interface TCCatModel : NSObject

@property (nonatomic, strong) NSString *object_id;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) TCBreedModel *breed;

-(instancetype)initWithJSONDictionary:(NSDictionary *)dict;
-(instancetype)initResultWithImageId:(NSString *)image_id withImageUrl:(NSString *)imageUrl withBreeddict:(NSDictionary *)breed;

@end
