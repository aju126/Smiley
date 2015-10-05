//
//  SmileyViewController.m
//  Smiley
//
//  Created by Shashikumar,Ajith on 10/2/15.
//  Copyright (c) 2015 Shashikumar,Ajith. All rights reserved.
//

#import "SmileyViewController.h"

@interface SmileyViewController () {
    double changedVal;
}


@end

@implementation SmileyViewController
@synthesize smiley;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [smiley setDataSource:self];
    changedVal = 0.5;
}

-(double)SmileFactor:(UIView *)sender {
    return changedVal;
}

-(void)updateUI {
    [smiley setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sliderChanged:(id)sender {
    changedVal = ((UISlider *)sender).value;
    [self updateUI];
}
@end
