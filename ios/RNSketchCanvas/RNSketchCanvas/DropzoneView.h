//
//  DropzoneView.h
//  RNSketchCanvas
//
//  Created by Samridh Gupta on 11/03/19.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DropzoneView : UIView

@property (nonatomic) UIImage *trashImage;
@property (nonatomic) UIImage *fadeImage;

- (void) toggleHover: (BOOL) state;
- (void) showView: (BOOL*) state;
@end

NS_ASSUME_NONNULL_END
