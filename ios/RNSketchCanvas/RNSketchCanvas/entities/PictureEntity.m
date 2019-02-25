//
//  PictureEntity.m
//  RNSketchCanvas
//
//  Created by Samridh Gupta on 14/02/19.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "base/MotionEntity.h"
#import "PictureEntity.h"

@implementation PictureEntity : MotionEntity
{
}

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
                     entityStrokeColor: (UIColor *)entityStrokeColor {
    
    // fetch image
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    if(image == nil) {
        image = [UIImage imageWithData: [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]]];
    }
    
    // check for portatait or landscape
    CGFloat imageHeight = image.size.height;
    CGFloat imageWidth = image.size.width;
    
    CGFloat sideLength = 500;
    
    CGFloat scaleFactor = 1.0;
    CGFloat height = sideLength;
    CGFloat width = sideLength;
    
    // set height or width to sideLength
    if(imageHeight > imageWidth) {
        scaleFactor = imageHeight / sideLength;
        width = imageWidth / scaleFactor;
    } else {
        scaleFactor = imageWidth / sideLength;
        height = imageHeight / scaleFactor;
    }
    
    CGFloat realParentCenterX = parentCenterX - width / 4;
    CGFloat realParentCenterY = parentCenterY - height / 4;
    CGFloat realWidth = width / 2;
    CGFloat realHeight = height / 2;
    
    self = [super initAndSetupWithParent:entityId
                             parentWidth:parentWidth
                            parentHeight:parentHeight
                           parentCenterX:realParentCenterX
                           parentCenterY:realParentCenterY
                       parentScreenScale:parentScreenScale
                                   width:realWidth
                                  height:realHeight
                          bordersPadding:bordersPadding
                             borderStyle:borderStyle
                       borderStrokeWidth:borderStrokeWidth
                       borderStrokeColor:borderStrokeColor
                       entityStrokeWidth:entityStrokeWidth
                       entityStrokeColor:entityStrokeColor];
    
    
    if (self) {
        self.MIN_SCALE = 0.3f;
        self.imageObject = image;
    }
    return self;
}

- (void)drawContent:(CGRect)rect withinContext:(CGContextRef)contextRef {
    CGContextSetLineWidth(contextRef, self.entityStrokeWidth / self.scale);
    CGContextSetStrokeColorWithColor(contextRef, [self.entityStrokeColor CGColor]);
    CGRect entityRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGFloat padding = (self.bordersPadding + self.entityStrokeWidth) / self.scale;
    entityRect = CGRectInset(entityRect, padding , padding);
    [self.imageObject drawInRect:entityRect];
}

@end
