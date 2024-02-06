//
//  TCSearchResult.h
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import <Foundation/Foundation.h>
#import "TCCatModel.h"

@interface TCSearchResult : NSObject

@property (nonatomic, strong) NSArray<TCCatModel *> *cat_objects;

-(instancetype)initWithJSONArray:(NSArray *)json;

@end
