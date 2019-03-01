//
//  PictureEntity.h
//  RNSketchCanvas
//
//  Created by Samridh Gupta on 14/02/19.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "base/MotionEntity.h"

@interface PictureEntity: MotionEntity

@property (nonatomic) UIImage *imageObject;

- (instancetype)initAndSetupWithParent: (NSString *)entityId
                           parentWidth: (NSInteger)parentWidth
                          parentHeight: (NSInteger)parentHeight
                         parentCenterX: (CGFloat)parentCenterX
                         parentCenterY: (CGFloat)parentCenterY
                     parentScreenScale: (CGFloat)parentScreenScale
                             filePath: (NSString *)filePath
                              imageURL: (NSString *) imageURL
                        bordersPadding: (CGFloat)bordersPadding
                           borderStyle: (enum BorderStyle)borderStyle
                     borderStrokeWidth: (CGFloat)borderStrokeWidth
                     borderStrokeColor: (UIColor *)borderStrokeColor
                     entityStrokeWidth: (CGFloat)entityStrokeWidth
                     entityStrokeColor: (UIColor *)entityStrokeColor;

@end
