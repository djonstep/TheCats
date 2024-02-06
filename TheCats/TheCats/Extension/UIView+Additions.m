//
//  UIView+Additions.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (void)addSubviewWithPinnedConstraintsView:(UIView *)view top:(NSNumber *)top leading:(NSNumber *)leading bottom:(NSNumber *)bottom trailing:(NSNumber *)trailing {
    [self addSubview:view];
    
    if (top != nil) {
        NSLayoutConstraint* topConstraint = [view.topAnchor constraintEqualToAnchor: self.topAnchor constant: top.floatValue];
        topConstraint.identifier = @"topConstraint";
        topConstraint.active = true;
    }
    
    if (leading != nil) {
        NSLayoutConstraint* leadingConstraint = [view.leadingAnchor constraintEqualToAnchor: self.leadingAnchor constant: leading.floatValue];
        leadingConstraint.identifier = @"leadingConstraint";
        leadingConstraint.active = true;
    }
    
    if (bottom != nil) {
        NSLayoutConstraint* bottomConstraint = [self.bottomAnchor constraintEqualToAnchor: view.bottomAnchor constant: bottom.floatValue];
        bottomConstraint.identifier = @"bottomConstraint";
        bottomConstraint.active = true;
    }
    
    if (trailing != nil) {
        NSLayoutConstraint* trailingConstraint = [self.trailingAnchor constraintEqualToAnchor: view.trailingAnchor constant: trailing.floatValue];
        trailingConstraint.identifier = @"trailingConstraint";
        trailingConstraint.active = true;
    }
}

@end
