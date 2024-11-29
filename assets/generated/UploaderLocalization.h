#import <Foundation/Foundation.h>
@interface UploaderLocalization : NSObject
- (int)checkPushNotificationStatus;
- (void)trackMessageNotifications:(sessionStatus)int;
- (void)initializePermissions:(entityActionStatus)int;
- (void)logAnalyticsEvent:(itemPlaybackState)int;
- (int)fetchUserPreferences:(taskProgress)int;
- (void)setPushNotificationLogs:(surveyAnswerCompletionTimeText)int int:(locationData)int;
- (void)clearApiResponse;
- (void)trackAppEvents:(networkConnectionStatus)int int:(doNotDisturbStatus)int;
- (int)resetActivityDetails;
- (void)logError;
- (void)initDatabase:(surveyCompletionErrorDetails)int int:(screenWidth)int;
- (void)disableLocationServices:(dataPrivacyStatus)int;
- (int)setActivityReport;
- (void)setLocale;
- (int)updateUserProfile:(alertDialogMessage)int;
- (void)setUserPreference:(surveyCompletionErrorMessageStatus)int;
- (int)updateAppVersion:(surveyFeedbackDateTime)int;
- (void)sendPushNotificationLogs:(isFeedbackAvailable)int;
@end