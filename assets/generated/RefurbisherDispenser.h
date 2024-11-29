#import <Foundation/Foundation.h>
@interface RefurbisherDispenser : NSObject
- (void)getUsageStats;
- (int)initializePushNotifications;
- (void)sendUserData:(syncError)int;
- (void)trackPushNotifications;
- (int)sendUserActivity:(surveyAnswerCompletionTimeMessage)int;
- (void)sendPushNotification:(errorDescription)int int:(locationPermissionStatus)int;
- (void)sendPutRequest;
- (void)saveUsageStats:(locationUpdateStatus)int int:(surveyCompletionDate)int;
- (int)getPageVisitData:(surveyFeedbackReceived)int int:(systemErrorStatus)int;
- (void)clearContent;
- (void)applyTheme:(feedbackSubmissionStatus)int int:(isAppUpToDate)int;
- (void)updateLanguage:(isAppInStartupState)int int:(alertMessage)int;
- (void)setLocationDetails;
- (void)getActivityReport;
@end