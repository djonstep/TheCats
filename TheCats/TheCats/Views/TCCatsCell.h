//
//  TCCatsCell.h
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import <UIKit/UIKit.h>

@interface TCCatsCell : UITableViewCell

-(void)configureWithName:(NSString *)name image:(UIImage *)thumbnail;
-(void)updateImage:(UIImage *)image;

@end
