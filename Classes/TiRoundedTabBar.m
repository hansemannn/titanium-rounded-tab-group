//
//  TiRoundedTabBar.m
//  titanium-rounded-tab-group
//
//  Created by Hans Knoechel on 14.02.21.
//

#import "TiRoundedTabBar.h"


@implementation TiRoundedTabBar

- (void)drawRect:(CGRect)rect
{
  [self addShape];
}

- (void)addShape
{
  CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
  shapeLayer.path = [self createPath];
  shapeLayer.fillColor = UIColor.whiteColor.CGColor;
  shapeLayer.lineWidth = 0.0;
  shapeLayer.shadowColor = UIColor.blackColor.CGColor;
  shapeLayer.shadowOffset = CGSizeMake(0, 0);
  shapeLayer.shadowRadius = 10.0;
  shapeLayer.shadowOpacity = 0.1;

  if (_shapeLayer != nil) {
    [self.layer replaceSublayer:_shapeLayer with:shapeLayer];
  } else {
    [self.layer insertSublayer:shapeLayer atIndex:0];
  }
  
  _shapeLayer = shapeLayer;
}

- (CGPathRef)createPath
{
  CGFloat height = 42.0;
  UIBezierPath *path = [UIBezierPath new];
  CGFloat centerWidth = self.frame.size.width / 2.0;

  [path moveToPoint:CGPointMake(0, 0)];
  [path addLineToPoint:CGPointMake((centerWidth - (height * 2)), 0)];
  
  [path addCurveToPoint:CGPointMake(centerWidth, height) controlPoint1:CGPointMake((centerWidth - 30), 0) controlPoint2:CGPointMake(centerWidth - 35, height)];

  [path addCurveToPoint:CGPointMake(centerWidth + (height * 2), 0) controlPoint1:CGPointMake((centerWidth + 35), height) controlPoint2:CGPointMake(centerWidth + 30, 0)];

  [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
  [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
  [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
  
  [path closePath];
  
  return path.CGPath;
}

@end
