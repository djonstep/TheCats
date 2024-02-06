//
//  TCCatsCell.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "TCCatsCell.h"
#import "UIView+Additions.h"

@interface TCCatsCell ()

@property (nonatomic, strong) UIImageView *thumbnailImageView;
@property (nonatomic, strong) UILabel *nameTitleLabel;

@end

@implementation TCCatsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.thumbnailImageView = [UIImageView new];
    self.thumbnailImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubviewWithPinnedConstraintsView:self.thumbnailImageView top:@8 leading:@8 bottom:@8 trailing:nil];
    [self.thumbnailImageView.heightAnchor constraintEqualToConstant:100].active = true;
    [self.thumbnailImageView.widthAnchor constraintEqualToAnchor:self.thumbnailImageView.heightAnchor  multiplier:1.0].active = true;
    
    self.nameTitleLabel = [UILabel new];
    [self.nameTitleLabel setTextColor:[UIColor blackColor]];
    [self.nameTitleLabel setFont:[UIFont systemFontOfSize:24]];
    self.nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubviewWithPinnedConstraintsView:self.nameTitleLabel top:nil leading:nil bottom:nil trailing:@8];
    [self.nameTitleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
    [self.nameTitleLabel.leadingAnchor constraintEqualToAnchor:self.thumbnailImageView.trailingAnchor constant:8].active = true;
}

- (void)configureWithName:(NSString *)name image:(UIImage *)thumbnail {
    [self.nameTitleLabel setText:name];
    [self.thumbnailImageView setImage:thumbnail];
}

-(void)updateImage:(UIImage *)image {
    [self.thumbnailImageView setImage:image];
}

@end
