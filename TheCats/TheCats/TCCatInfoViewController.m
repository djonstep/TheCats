//
//  TCCatInfoViewController.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "TCCatInfoViewController.h"
#import "UIView+Additions.h"
#import "TCCatsDataManager.h"

@interface TCCatInfoViewController ()

@property (nonatomic, strong) UIImageView *catImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *originLabel;
@property (nonatomic, strong) UILabel *lifeSpanLabel;
@property (nonatomic, strong) UILabel *temperamentLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation TCCatInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self updateInformation];
}

- (void)setupView {
    UINavigationBarAppearance *barAppearance = [UINavigationBarAppearance new];
    barAppearance.backgroundColor = [UIColor whiteColor];
    self.navigationItem.standardAppearance = barAppearance;
    self.navigationItem.scrollEdgeAppearance = barAppearance;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.catImageView = [UIImageView new];
    self.catImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.catImageView setImage:[UIImage imageNamed:@"test"]];
    self.catImageView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubviewWithPinnedConstraintsView:self.catImageView top:@110 leading:nil bottom:nil trailing:nil];
    [self.catImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.catImageView.heightAnchor constraintEqualToConstant:200].active = true;
    [self.catImageView.widthAnchor constraintEqualToAnchor:self.catImageView.heightAnchor  multiplier:1.0].active = true;
    
    self.nameLabel = [UILabel new];
    [self.nameLabel setTextColor:[UIColor blackColor]];
    [self.nameLabel setFont:[UIFont boldSystemFontOfSize:24]];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubviewWithPinnedConstraintsView:self.nameLabel top:nil leading:@8 bottom:nil trailing:nil];
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.catImageView.bottomAnchor constant:8].active = true;
    
    self.originLabel = [UILabel new];
    [self.originLabel setTextColor:[UIColor darkGrayColor]];
    [self.originLabel setFont:[UIFont boldSystemFontOfSize:14]];
    self.originLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.originLabel];
    [self.originLabel.centerYAnchor constraintEqualToAnchor:self.nameLabel.centerYAnchor].active = true;
    [self.originLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.trailingAnchor constant:8].active = true;
    
    self.lifeSpanLabel = [UILabel new];
    self.lifeSpanLabel.textAlignment = NSTextAlignmentRight;
    [self.lifeSpanLabel setTextColor:[UIColor darkGrayColor]];
    [self.lifeSpanLabel setFont:[UIFont systemFontOfSize:14]];
    self.lifeSpanLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubviewWithPinnedConstraintsView:self.lifeSpanLabel top:nil leading:nil bottom:nil trailing:@8];
    [self.lifeSpanLabel.centerYAnchor constraintEqualToAnchor:self.nameLabel.centerYAnchor].active = true;
    [self.lifeSpanLabel.leadingAnchor constraintEqualToAnchor:self.originLabel.trailingAnchor constant:8].active = true;
    
    self.temperamentLabel = [UILabel new];
    self.temperamentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.temperamentLabel.numberOfLines = 0;
    [self.temperamentLabel setTextColor:[UIColor blackColor]];
    [self.temperamentLabel setFont:[UIFont systemFontOfSize:16]];
    self.temperamentLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubviewWithPinnedConstraintsView:self.temperamentLabel top:nil leading:@8 bottom:nil trailing:@8];
    [self.temperamentLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:8].active = true;
    
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.descriptionLabel.numberOfLines = 0;
    [self.descriptionLabel setTextColor:[UIColor blackColor]];
    [self.descriptionLabel setFont:[UIFont systemFontOfSize:16]];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubviewWithPinnedConstraintsView:self.descriptionLabel top:nil leading:@8 bottom:nil trailing:@8];
    [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.temperamentLabel.bottomAnchor constant:8].active = true;
}

-(void)updateInformation {
    if (self.catInfo != nil) {
        UIImage *catImage = [[TCCatsDataManager sharedManager] getCatImage:self.catInfo.object_id];
        if (catImage != nil) {
            [self.catImageView setImage:catImage];
        }
        self.title = self.catInfo.breed.name;
        [self.nameLabel setText:self.catInfo.breed.name];
        NSString *origin = [NSString stringWithFormat:@"(%@)", self.catInfo.breed.origin];
        [self.originLabel setText:origin];
        [self.lifeSpanLabel setText:self.catInfo.breed.life_span];
        [self.temperamentLabel setText:self.catInfo.breed.temperament];
        [self.descriptionLabel setText:self.catInfo.breed.bread_description];
    }
}

@end
