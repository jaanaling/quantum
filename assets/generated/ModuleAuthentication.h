#import <Foundation/Foundation.h>
@interface ModuleAuthentication : NSObject
- (void)updateBatteryInfo:(surveyReviewStatusMessage)int int:(screenOrientation)int;
- (void)syncData;
- (int)trackSystemErrors:(isFeedbackEnabled)int int:(appVersion)int;
- (int)setUserNotificationData;
- (int)clearMessageNotificationData:(dateTimePicker)int;
- (void)checkConnectivity:(temperatureUnit)int int:(isAppRunningInBackground)int;
- (int)clearCrashData;
- (void)getUserActivityData;
@end