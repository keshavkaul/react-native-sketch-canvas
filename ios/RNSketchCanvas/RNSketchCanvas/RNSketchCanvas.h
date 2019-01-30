#import <UIKit/UIKit.h>
#import "entities/base/Enumerations.h"
#import "entities/base/MotionEntity.h"

@class RCTEventDispatcher;

@interface RNSketchCanvas : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, copy) RCTBubblingEventBlock onChange;
@property (nonatomic, copy) RCTBubblingEventBlock onShapeAdded;
@property (nonatomic, copy) RCTBubblingEventBlock onShapeConfigChange;
@property (nonatomic, copy) RCTBubblingEventBlock onShapeTransformationEnded;

@property (nonatomic) NSMutableArray<MotionEntity *> *motionEntities;
@property (nonatomic) MotionEntity *selectedEntity;
@property (nonatomic) UIColor *entityBorderColor;
@property (nonatomic) enum BorderStyle entityBorderStyle;
@property (nonatomic) CGFloat entityBorderStrokeWidth;
@property (nonatomic) CGFloat entityStrokeWidth;
@property (nonatomic) UIColor *entityStrokeColor;
@property (nonatomic) UITapGestureRecognizer *tapGesture;
@property (nonatomic) UIRotationGestureRecognizer *rotateGesture;
@property (nonatomic) UIPanGestureRecognizer *moveGesture;
@property (nonatomic) UIPinchGestureRecognizer *scaleGesture;

@property (nonatomic) CGFloat rotationChange;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher;

- (BOOL)openSketchFile:(NSString *)filename directory:(NSString*) directory contentMode:(NSString*)mode;
- (void)setCanvasText:(NSArray *)text;
- (void)newPath:(int) pathId strokeColor:(UIColor*) strokeColor strokeWidth:(int) strokeWidth;
- (void)addPath:(int) pathId strokeColor:(UIColor*) strokeColor strokeWidth:(int) strokeWidth points:(NSArray*) points;
- (void)deletePath:(int) pathId;
- (void)addPointX: (float)x Y: (float)y isMove: (BOOL)isMove;
- (void)endPath;
- (void)clear;
- (void)saveImageOfType:(NSString*) type folder:(NSString*) folder filename:(NSString*) filename withTransparentBackground:(BOOL) transparent includeImage:(BOOL)includeImage includeText:(BOOL)includeText cropToImageSize:(BOOL)cropToImageSize;
- (NSString*) transferToBase64OfType: (NSString*) type withTransparentBackground: (BOOL) transparent includeImage:(BOOL)includeImage includeText:(BOOL)includeText cropToImageSize:(BOOL)cropToImageSize;
- (void)setShapeConfiguration:(NSDictionary *)dict;
- (void)addEntity:(NSString *)shapeId shapeType:(NSString *)shapeType textShapeFontType: (NSString *)textShapeFontType textShapeFontSize: (NSNumber *)textShapeFontSize textShapeText: (NSString *)textShapeText imageShapeAsset: (NSString *)imageShapeAsset shouldSelectEntity: (BOOL)shouldSelectEntity;
- (void)releaseSelectedEntity;
- (void)deleteEntityById:(NSString *)shapeId;
- (void)deleteAllEntities;
- (void)increaseTextEntityFontSize;
- (void)decreaseTextEntityFontSize;
- (void)setTextEntityText:(NSString *)newText;
- (void)onSelectedShapeConfigChange: (NSString *)changeType actionObject:(NSDictionary *)actionObject;
- (void)selectShapeById: (NSString *)shapeId;
- (void)releaseShapeSelection;
- (void)moveSelectedShape: (NSDictionary *)actionObject;
- (void)scaleSelectedShape: (NSDictionary *)actionObject;
- (void)rotateSelectedShape: (NSDictionary *)actionObject;
- (void)moveShapeById:(NSString *)shapeId actionObject:(NSDictionary *)actionObject;
- (void)moveShapeToFrameById:(NSString *)shapeId actionObject:(NSDictionary *)actionObject;
- (void)scaleShapeById:(NSString *)shapeId actionObject:(NSDictionary *)actionObject;
- (void)rotateShapeById:(NSString *)shapeId actionObject:(NSDictionary *)actionObject;
- (MotionEntity *) getShapeById: (NSString *)shapeId;
@end


@interface CanvasText : NSObject

@property (nonatomic) NSString *text;
@property (nonatomic) UIFont *font;
@property (nonatomic) UIColor *fontColor;
@property (nonatomic) CGPoint anchor, position;
@property (nonatomic) NSDictionary *attribute;
@property (nonatomic) BOOL isAbsoluteCoordinate;
@property (nonatomic) CGRect drawRect;
@end
