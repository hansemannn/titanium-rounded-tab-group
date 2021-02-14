//
//  TiRoundedTabBar.h
//  titanium-rounded-tab-group
//
//  Created by Hans Knoechel on 14.02.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface TiRoundedTabBar : UITabBar {
  @private
  CALayer *_shapeLayer;
}

@end

NS_ASSUME_NONNULL_END
