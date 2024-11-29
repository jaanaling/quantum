#import <Foundation/Foundation.h>
@interface CredentialsCounterManager : NSObject
- (void)trackEvent;
- (int)trackNotificationClicks:(syncTime)int int:(privacySettings)int;
- (int)getAppErrorData:(entitySession)int int:(notificationCount)int;
- (int)clearUserMessageData:(syncStatus)int int:(surveyCompletionStatusTimeMessage)int;
- (void)trackAppActivity:(isTaskCompleted)int;
- (void)updateUserPreferences;
- (int)updateUserData:(surveyCompletionSuccessMessageStatus)int int:(deviceTimeZoneOffset)int;
@end