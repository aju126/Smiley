//
//  SmileyViewController.h
//  Smiley
//
//  Created by Shashikumar,Ajith on 10/2/15.
//  Copyright (c) 2015 Shashikumar,Ajith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmileyView.h"

@interface SmileyViewController : UIViewController<SmileyDataSource>

@property (weak, nonatomic) IBOutlet SmileyView *smiley;
@property (weak, nonatomic) IBOutlet UISlider *smileySlider;
- (IBAction)sliderChanged:(id)sender;

@end
