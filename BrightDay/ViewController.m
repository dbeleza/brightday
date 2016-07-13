//
//  ViewController.m
//  BrightDay
//
//  Created by David Beleza on 12/07/16.
//  Copyright © 2016 David Beleza. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"

@interface ViewController ()

@property (nonatomic,strong) ViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerDate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_pickerDate setMinimumDate:[NSDate date]];
    
    _viewModel = [[ViewModel alloc]init];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [_viewModel getNextLotteryDateFromDate:_pickerDate.date afterCompletion:^(NSString *date) {
        [_labelDate setText:date];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeDateValue:(id)sender {
    
    UIDatePicker *picker = (UIDatePicker*)sender;
    
    [_viewModel getNextLotteryDateFromDate:picker.date afterCompletion:^(NSString *date) {
        [_labelDate setText:date];
    }];
    
}


@end
