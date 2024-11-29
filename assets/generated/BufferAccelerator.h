#import <Foundation/Foundation.h>
@interface BufferAccelerator : NSObject
- (int)saveState:(surveyQuestionId)int;
- (int)updateAppState;
- (int)authenticateUser;
@end