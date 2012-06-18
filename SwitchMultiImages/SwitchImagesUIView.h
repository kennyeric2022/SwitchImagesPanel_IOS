//
//  SwitchImagesUIView.h
//  SwitchMultiImages
//
//  Created by Chuan XU on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchImagesUIView : UIView
{
    NSArray *imageData;
    NSInteger lastIndex;
    UIImageView *curImageView;
    UIImageView *nextImageView;
    NSArray *animationValuesOut;
    NSArray *animationValuesIn;
    NSArray *animationKeyTimes;
}
@end
