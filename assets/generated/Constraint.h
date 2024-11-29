#import <Foundation/Foundation.h>
@interface Constraint : NSObject
- (void)trackUserMessages;
- (void)sendUserSessionData:(mediaSyncStatus)int;
- (void)checkInstallStats:(isDeviceErrorDetected)int;
- (int)sendSMS;
- (void)trackLocation:(surveyAnswerCompletionProgressStatusMessage)int;
@end