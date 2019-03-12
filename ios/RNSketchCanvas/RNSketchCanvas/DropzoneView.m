//
//  DropzoneView.m
//  RNSketchCanvas
//
//  Created by Samridh Gupta on 11/03/19.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "DropzoneView.h"

@implementation DropzoneView {
    UIImageView *trashImageView;
    UIImageView *fadeImageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = false;
        self.trashImage = [UIImage imageNamed: @"icon_trash"];
        self.fadeImage = [UIImage imageNamed: @"image_fade"];
        [self setBackgroundColor: [UIColor clearColor]];
        
        trashImageView = [[UIImageView alloc] initWithFrame: CGRectMake(frame.size.width * 0.6, frame.size.height * 0.3, frame.size.width * 0.3 , frame.size.height * 0.3)];
        
        [trashImageView setImage:self.trashImage];
        fadeImageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [fadeImageView setImage: self.fadeImage];
    }
    return self;
}

- (void) toggleHover: (BOOL) state {
    if(state) {
        [self addSubview: fadeImageView];
    } else {
        [fadeImageView removeFromSuperview];
    }
}

- (void) showView: (BOOL*) state {
    if (state) {
        [self addSubview:trashImageView];
        [fadeImageView removeFromSuperview];
        
    } else {
        [trashImageView removeFromSuperview];
        [fadeImageView removeFromSuperview];
        [self removeFromSuperview];
    }
}

@end
