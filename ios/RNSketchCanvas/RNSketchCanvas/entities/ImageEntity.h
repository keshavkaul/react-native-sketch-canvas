//
//  ImageEntity.h
//  RNSketchCanvas
//
//  Created by Samridh Gupta on 28/01/19.
//  Copyright © 2019 Terry. All rights reserved.
//
#import "base/MotionEntity.h"

@interface ImageEntity : MotionEntity

@property (nonatomic) NSString *imageName;

- (instancetype)initAndSetupWithParent: (NSString *)entityId
                           parentWidth: (NSInteger)parentWidth
                          parentHeight: (NSInteger)parentHeight
                         parentCenterX: (CGFloat)parentCenterX
                         parentCenterY: (CGFloat)parentCenterY
                     parentScreenScale: (CGFloat)parentScreenScale
                                 width: (NSInteger)width
                                height: (NSInteger)height
                             imageName: (NSString *)imageName
                        bordersPadding: (CGFloat)bordersPadding
                           borderStyle: (enum BorderStyle)borderStyle
                     borderStrokeWidth: (CGFloat)borderStrokeWidth
                     borderStrokeColor: (UIColor *)borderStrokeColor
                     entityStrokeWidth: (CGFloat)entityStrokeWidth
                     entityStrokeColor: (UIColor *)entityStrokeColor;

@end
