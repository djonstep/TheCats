//
//  UIView+Additions.h
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

-(void)addSubviewWithPinnedConstraintsView:(UIView *)view top:(NSNumber *)top leading:(NSNumber *)leading bottom:(NSNumber *)bottom trailing:(NSNumber *)trailing;

@end
