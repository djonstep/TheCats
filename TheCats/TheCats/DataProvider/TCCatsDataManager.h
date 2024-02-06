//
//  TCCatsDataManager.h
//  TheCats
//
//  Created by Admin on 06.02.2024.
//

#import <UIKit/UIKit.h>
#import "TCCatModel.h"

@interface TCCatsDataManager : NSObject

+(instancetype)sharedManager;

-(void)startLoadCatsDataWithCompletion: (void (^)(BOOL))success;

-(NSInteger)numberOfresultSearch;
-(TCCatModel *)searchCatWithIndex:(NSInteger)index;

-(UIImage *)getCatImage:(NSString *)cat_id;
-(void)cashCatImage:(NSString *)cat_id image:(UIImage *)image;

@end
