//
//  SmileyView.h
//  Smiley
//
//  Created by Shashikumar,Ajith on 10/2/15.
//  Copyright (c) 2015 Shashikumar,Ajith. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SmileyDataSource <NSObject>

-(double)SmileFactor:(UIView *)sender;

@end

IB_DESIGNABLE
@interface SmileyView : UIView

IBInspectable
@property (nonatomic) double padding;
IBInspectable
@property (nonatomic) double lineWidth;
IBInspectable
@property (nonatomic,strong) UIColor *lineColor;

@property (nonatomic, unsafe_unretained) id<SmileyDataSource> dataSource;


-(id)initFaceView : (CGRect)frame;
@end
