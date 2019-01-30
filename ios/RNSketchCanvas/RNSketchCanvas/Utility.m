//
//  Utility.m
//  RNSketchCanvas
//
//  Created by TERRY on 2018/5/8.
//  Copyright © 2018年 Terry. All rights reserved.
//

#import "Utility.h"
#import "entities/base/MotionEntity.h"

CGPoint midPoint (CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

@implementation Utility

+ (void)addPointToPath: (UIBezierPath*)path
               toPoint: (CGPoint)point
         tertiaryPoint: (CGPoint)tPoint
         previousPoint: (CGPoint) pPoint {
    CGPoint mid1 = midPoint(pPoint, tPoint);
    CGPoint mid2 = midPoint(point, pPoint);
    [path moveToPoint: mid1];
    [path addQuadCurveToPoint: mid2 controlPoint: pPoint];
}

+ (BOOL)isSameColor:(UIColor *)color1 color:(UIColor *)color2 {
    CGFloat red1, green1, blue1, alpha1;
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    CGFloat red2, green2, blue2, alpha2;
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];
    if (red1 == red2 && green1 == green2 && blue1 == blue2 && alpha1 == alpha2) {
        return true;
    }
    return false;
}

+ (CGRect)fillImageWithSize:(CGSize)imgSize toSize:(CGSize)targetSize contentMode:(NSString*)mode {
    CGFloat imageAspectRatio = imgSize.width / imgSize.height;
    CGFloat targetAspectRatio = targetSize.width / targetSize.height;
    switch ([@[@"AspectFill", @"AspectFit", @"ScaleToFill"] indexOfObject: mode]) {
        case 0: {
            CGFloat scaleFactor = targetAspectRatio < imageAspectRatio ? targetSize.height / imgSize.height : targetSize.width / imgSize.width;
            CGFloat w = imgSize.width * scaleFactor, h = imgSize.height * scaleFactor;
            return CGRectMake((targetSize.width - w) / 2, (targetSize.height - h) / 2, w, h);
        }
        case 1:
        case NSNotFound:
        default: {
            CGFloat scaleFactor = targetAspectRatio > imageAspectRatio ? targetSize.height / imgSize.height : targetSize.width / imgSize.width;
            CGFloat w = imgSize.width * scaleFactor, h = imgSize.height * scaleFactor;
            return CGRectMake((targetSize.width - w) / 2, (targetSize.height - h) / 2, w, h);
        }
        case 2: {
            return  CGRectMake(0, 0, targetSize.width, targetSize.height);
        }
    }
}

+ (BOOL)pointInTriangle:(CGPoint)pt v1: (CGPoint)v1 v2: (CGPoint)v2 v3:(CGPoint)v3 {
    bool b1 = [self crossProduct:pt withCGPointB:v1 withCGPointC:v2] < 0.0;
    bool b2 = [self crossProduct:pt withCGPointB:v2 withCGPointC:v3] < 0.0;
    bool b3 = [self crossProduct:pt withCGPointB:v3 withCGPointC:v1] < 0.0;
    
    return (b1 == b2) && (b2 == b3);
}

+ (CGFloat)crossProduct:(CGPoint)a withCGPointB: (CGPoint)b withCGPointC: (CGPoint)c {
    return [self crossProduct:a.x ay:a.y bx:b.x by:b.y cx:c.x cy:c.y];
}

+ (CGFloat)crossProduct:(CGFloat)ax ay: (CGFloat)ay bx: (CGFloat)bx by: (CGFloat)by cx: (CGFloat)cx cy: (CGFloat)cy {
    return (ax - cx) * (by - cy) - (bx - cx) * (ay - cy);
}

+ (NSDictionary *)getPointData: (CGPoint)point {
    return @{@"x": [NSNumber numberWithFloat:point.x],
             @"y": [NSNumber numberWithFloat:point.y] };
}

+ (NSDictionary *)getFrameData: (CGRect)rect {
    return @{
             @"origin": [self getPointData: rect.origin],
             @"size": @{@"height": [NSNumber numberWithFloat: rect.size.height], @"width": [NSNumber numberWithFloat: rect.size.width] }};
}

+ (NSDictionary *)getEntityConfig: (MotionEntity *)entityObject {
    return  @{
              @"shapeId": entityObject.entityId,
              @"scale": [NSNumber numberWithFloat:(entityObject.scale) ],
              @"positon": entityObject,
              @"strokeColor": entityObject.entityStrokeColor,
              @"borderStrokeColor": entityObject.borderStrokeColor,
              @"strokeWidth": [NSNumber numberWithFloat:(entityObject.entityStrokeWidth)],
              @"borderStrokeWidth": [NSNumber numberWithFloat:(entityObject.borderStrokeWidth)],
              @"centerPoint": [self getPointData: entityObject.centerPoint],
              @"rotation": [NSNumber numberWithFloat:(entityObject.rotation) ],
              @"frame": [self getFrameData:(CGRect)([(MotionEntity *)entityObject frame])]
              };
}

@end
