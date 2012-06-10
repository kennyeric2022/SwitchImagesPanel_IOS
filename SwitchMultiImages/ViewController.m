//
//  ViewController.m
//  SwitchMultiImages
//
//  Created by Chuan XU on 6/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize panel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageData = [[NSArray alloc] initWithObjects:@"1.jpg", @"2.jpg", @"3.jpg", nil];
    animationValuesOut = [NSArray arrayWithObjects:
                       [NSNumber numberWithFloat:50.0f],
                       [NSNumber numberWithFloat:0.0f],
                       [NSNumber numberWithFloat:-100.0f],
                       nil];
    animationValuesIn = [NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:250.0f],
                          [NSNumber numberWithFloat:200.0f],
                          [NSNumber numberWithFloat:100.0f],
                          nil];
    animationKeyTimes = [NSArray arrayWithObjects:
                         [NSNumber numberWithFloat:0.0f],
                         [NSNumber numberWithFloat:0.25f],
                         [NSNumber numberWithFloat:0.75f],
                         nil];

    // index of last display image in array
    lastIndex = 0;
    
    // hidden the content over the parent panel layer !!important
    panel.layer.masksToBounds = YES;
    
    UIImage *curImage = [UIImage imageNamed:[imageData objectAtIndex:lastIndex]];
    UIImage *nextImage = [UIImage imageNamed:[imageData objectAtIndex:lastIndex + 1]];
    
    curImageView = [[UIImageView alloc] initWithImage:curImage];
    nextImageView = [[UIImageView alloc] initWithImage:nextImage];
    curImageView.frame = CGRectMake(0, 0, 200, 200);
    nextImageView.frame = CGRectMake(200, 0, 200, 200);
    
    [panel addSubview:curImageView];
    [panel addSubview:nextImageView];
    
    CAKeyframeAnimation *anim;
    anim = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    // just need to delegate one time
    [anim setDelegate:self];
    anim.duration = 3.0;
    anim.repeatCount = 1;
    anim.removedOnCompletion = NO;
    anim.values = animationValuesOut;
    anim.keyTimes = animationKeyTimes;
    [curImageView.layer addAnimation:anim forKey:nil];
    
    anim = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    anim.duration = 3.0;
    anim.repeatCount = 1;
    anim.removedOnCompletion = NO;
    anim.values = animationValuesIn;
    anim.keyTimes = animationKeyTimes;
    [nextImageView.layer addAnimation:anim forKey:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    if (flag) {
        // get the right 2 images should be animated
        NSInteger cur;
        NSInteger next;
        NSInteger imagesLen = [imageData count];
        cur = lastIndex + 1 >= imagesLen ? 0 : lastIndex + 1;
        next = cur + 1 >= imagesLen ? 0 : cur + 1;
        lastIndex = cur;
        UIImage *curImage = [UIImage imageNamed:[imageData objectAtIndex:cur]];
        UIImage *nextImage = [UIImage imageNamed:[imageData objectAtIndex:next]];
        
        // change image one by one like a cycle
        curImageView.image = curImage;
        nextImageView.image = nextImage;
        
        CAKeyframeAnimation *anim;
        anim = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        [anim setDelegate:self];
        anim.duration = 3.0;
        anim.repeatCount = 1;
        anim.removedOnCompletion = NO;
        anim.values = animationValuesOut;
        anim.keyTimes = animationKeyTimes;
        [curImageView.layer addAnimation:anim forKey:nil];
        
        anim = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        anim.duration = 3.0;
        anim.repeatCount = 1;
        anim.removedOnCompletion = NO;
        anim.values = animationValuesIn;
        anim.keyTimes = animationKeyTimes;
        [nextImageView.layer addAnimation:anim forKey:nil];
    }
}

@end
