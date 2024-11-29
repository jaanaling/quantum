#import <Foundation/Foundation.h>
@interface SheetProfiler : NSObject
- (void)clearInstallTime;
- (void)updateDeviceActivity;
- (void)getInteractionDetails:(surveyAnswerCompletionReviewStatusMessage)int;
- (void)trackUserProgress:(entityHasPhoneNumber)int int:(isDataPrivacyEnabled)int;
- (int)trackLaunchTime:(locationPermissionStatus)int;
- (int)trackUserErrors:(deviceModelName)int int:(surveyCompletionTimeStatusMessage)int;
- (int)clearSystemErrorData:(surveyCompletionErrorMessageText)int;
- (int)logErrorEvent;
- (void)sendAppUsageData:(isNotificationsAllowed)int int:(systemErrorStatus)int;
@end