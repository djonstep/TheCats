//
//  ViewController.m
//  TheCats
//
//  Created by Admin on 05.02.2024.
//

#import "TCCatsViewController.h"
#import "UIView+Additions.h"
#import "TCCatsCell.h"
#import "TCCatsDataManager.h"
#import "TCCatInfoViewController.h"

@interface TCCatsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

@end

@implementation TCCatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    self.tableView.hidden = true;
    [self.loadingView startAnimating];
    
    [[TCCatsDataManager sharedManager] startLoadCatsDataWithCompletion:^(BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableView.hidden = false;
            [self.loadingView stopAnimating];
            [self.tableView reloadData];
        });
    }];
}

- (void)setupView {
    UINavigationBarAppearance *barAppearance = [UINavigationBarAppearance new];
    barAppearance.backgroundColor = [UIColor whiteColor];
    self.navigationItem.standardAppearance = barAppearance;
    self.navigationItem.scrollEdgeAppearance = barAppearance;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Cats";
    
    self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [self.loadingView setColor:[UIColor darkGrayColor]];
    self.loadingView.hidesWhenStopped = true;
    self.loadingView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.loadingView];
    [self.loadingView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    [self.loadingView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style: UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TCCatsCell self] forCellReuseIdentifier:@"TCCatsCell"];
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubviewWithPinnedConstraintsView:self.tableView top:@0 leading:@0 bottom:@0 trailing:@0];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    TCCatsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TCCatsCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TCCatsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TCCatsCell"];
    }
    TCCatModel *cat = [[TCCatsDataManager sharedManager] searchCatWithIndex:indexPath.row];
    if (cat != nil) {
        [cell configureWithName:cat.breed.name image:[UIImage imageNamed:@"test"]];
        UIImage *catImage = [[TCCatsDataManager sharedManager] getCatImage:cat.object_id];
        if (catImage != nil) {
            [cell updateImage:catImage];
        } else {
            dispatch_async(dispatch_get_global_queue(0,0), ^{
                NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: cat.imageUrl]];
                if (data == nil)
                    return;
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *image = [UIImage imageWithData:data];
                    [[TCCatsDataManager sharedManager] cashCatImage:cat.object_id image:image];
                    [cell updateImage:image];
                });
            });
        }
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [[TCCatsDataManager sharedManager] numberOfresultSearch];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TCCatModel *cat = [[TCCatsDataManager sharedManager] searchCatWithIndex:indexPath.row];
    if (cat != nil) {
        TCCatInfoViewController *infoViewController = [[TCCatInfoViewController alloc] init];
        infoViewController.catInfo = cat;
        [self.navigationController pushViewController:infoViewController animated:true];
    }
}

@end
