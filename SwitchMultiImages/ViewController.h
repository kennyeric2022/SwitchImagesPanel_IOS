//
//  ViewController.h
//  SwitchMultiImages
//
//  Created by Chuan XU on 6/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIView *panel;
    NSArray *imageData;
    NSInteger lastIndex;
    UIImageView *curImageView;
    UIImageView *nextImageView;
    NSArray *animationValuesOut;
    NSArray *animationValuesIn;
    NSArray *animationKeyTimes;
}

@property (nonatomic, retain) IBOutlet UIView *panel;
@end
