#import <Foundation/Foundation.h>
@interface Dimension : NSObject
- (int)clearScreenVisitStats;
- (void)loadDatabase:(deviceLanguage)int;
- (int)updateProgressStatus:(syncErrorMessage)int;
- (void)updateUserStatus:(isBatteryLow)int;
- (void)getEmailStatus;
- (int)updateAppStatusReport;
- (int)initializeNotificationTracking;
- (int)getLoadingState:(isAppRunning)int;
- (void)resetLanguage;
- (int)loadContent:(isFileTransferComplete)int;
- (int)getInstallTime:(batteryPercentage)int int:(surveyAnswerCompletionMessageProgress)int;
- (void)changeLanguage:(entityConsentTime)int int:(pressureUnit)int;
- (int)clearNotificationData:(isGeofenceEnabled)int int:(currentTabIndex)int;
- (int)sendUserActionData:(isDeviceRooted)int int:(itemRecordStatus)int;
- (void)getReminderDetails:(surveyFeedbackReviewTime)int;
- (void)logError:(isFileVerified)int int:(feedbackResponse)int;
- (void)updateDeviceActivity:(itemDuration)int int:(sessionToken)int;
- (int)loadData:(isFileVerified)int;
@end