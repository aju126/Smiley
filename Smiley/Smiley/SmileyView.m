//
//  SmileyView.m
//  Smiley
//
//  Created by Shashikumar,Ajith on 10/2/15.
//  Copyright (c) 2015 Shashikumar,Ajith. All rights reserved.
//

#import "SmileyView.h"

@implementation SmileyView

@synthesize padding = _padding ;
@synthesize lineWidth = _lineWidth;
@synthesize lineColor = _lineColor;
@synthesize dataSource;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.



-(id)initFaceView : (CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.padding = 0.6;
        self.lineWidth = 3;
        self.lineColor = [UIColor redColor];
    }
    return self;
}

-(CGPoint)CenterInView {
    return [self convertPoint:self.center fromView:self.superview];
}

-(CGFloat)ViewRadius {
    return MIN(self.frame.size.width, self.frame.size.height) / 2 * self.padding;
}

-(CGFloat)endAngle {
    return ((CGFloat) 2 * M_PI);
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[self pathForFace] stroke];
    [[self pathForLeftEye] stroke];
    [[self pathForRightEye] stroke];
    [[self pathforSmile] stroke];
}

-(UIBezierPath *)pathForFace {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:[self CenterInView] radius:[self ViewRadius] startAngle:0 endAngle:[self endAngle] clockwise:true];
    path.lineWidth = self.lineWidth;
    [self.lineColor set];
    return path;
}



-(UIBezierPath *)pathForLeftEye {
    
    double radius = [self ViewRadius];
    CGPoint centerPoint = [self CenterInView];
    CGRect rect  = CGRectMake(centerPoint.x - radius / 2,  centerPoint.y - radius / 2, radius / 4, radius / 4);
    UIBezierPath *lefteye = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:[self ViewRadius]];
    lefteye.lineWidth = self.lineWidth;
     [self.lineColor set];
    return lefteye;
}

-(UIBezierPath *)pathForRightEye {
    
    double radius = [self ViewRadius];
    CGPoint centerPoint = [self CenterInView];
    CGRect rect  = CGRectMake(centerPoint.x + radius / 4,  centerPoint.y - radius / 2, radius / 4, radius / 4);
    UIBezierPath *righteye = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:[self ViewRadius]];
    righteye.lineWidth = self.lineWidth;
    [self.lineColor set];
    return righteye;
    
}

-(UIBezierPath *)pathforSmile {
    
    double radius = [self ViewRadius];
    CGPoint centerPoint = [self CenterInView];
    CGRect rect = CGRectMake(centerPoint.x - radius / 2 , centerPoint.y + radius / 2, radius, 1.0);
    UIBezierPath *smile = [UIBezierPath bezierPathWithRect:CGRectZero];
    CGPoint start = rect.origin;
    CGPoint end = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
    CGPoint cp1 = CGPointMake(centerPoint.x, [self SmileyFactorForRect:centerPoint.y + radius andend:centerPoint.y + radius / 6]);
    CGPoint cp2 = CGPointMake(centerPoint.x, [self SmileyFactorForRect:centerPoint.y + radius andend:centerPoint.y + radius / 6]);
    [smile moveToPoint:start];
    [smile addCurveToPoint:end controlPoint1:cp1 controlPoint2:cp2];
    smile.lineWidth = self.lineWidth;
    [self.lineColor set];
    return smile;
}

-(double)SmileyFactorForRect :(double)y1 andend : (double)y2 {
    
    NSLog(@"changed valye %f", [self.dataSource SmileFactor:self]);
    double val = [self.dataSource SmileFactor:self];
    NSLog(@"y2 is %f y1 is %f", y2 , y1);
    return y2 + (y1 - y2) * val ;
    
}

#pragma setters for variables

-(void)setPadding:(double)pad {
     _padding = pad;
    [self setNeedsDisplay];
}

-(double)padding {
    return _padding == 0? 0.9 : _padding;
}

-(void)setLineWidth:(double)lineW {
    self.lineWidth = lineW;
    [self setNeedsDisplay];
}

-(double)lineWidth {
    return _lineWidth == 0 ? 5 : _lineWidth;
}

-(void)setLineColor:(UIColor *)Color {
    self.lineColor = Color;
    [self setNeedsDisplay];
}
-(UIColor*)lineColor {
    return _lineColor = [UIColor redColor];
}

@end
