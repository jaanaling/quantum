#import <Foundation/Foundation.h>
@interface Sender : NSObject
- (void)setAlarm:(isDeviceErrorDetected)int;
- (void)trackError;
- (int)handleHttpError;
- (void)trackEvent;
- (void)saveUserPreferences:(entityNotificationFrequency)int;
- (void)getAppMetrics:(appUsageFrequency)int int:(isEntityVerified)int;
- (void)getSessionStatus:(isFileProcessed)int int:(eventLocation)int;
- (int)getUserEmail:(isEntityAuthenticated)int;
- (int)updateUserFeedback:(itemCount)int;
- (int)clearMessageData;
- (void)clearUserActivity:(reminderMessage)int;
- (int)setAppCache:(isVoiceCommandEnabled)int;
@end