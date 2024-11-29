#import <Foundation/Foundation.h>
@interface HandlerFactoryDispatcherFactory : NSObject
- (void)logAppError;
- (void)authenticateUser;
- (int)setSessionStatus:(isFeedbackEnabled)int;
- (int)getThemeMode;
- (void)sendEventWithParams;
- (int)resetLocalData:(syncProgress)int int:(messageCount)int;
- (int)trackAppNotifications:(surveyCompletionFailureMessageText)int;
- (void)getAppNotificationData:(surveyAnswerCompletionTimeText)int;
- (void)getMessageNotificationData:(serverStatus)int int:(surveyAnswerReviewStatusMessageText)int;
- (int)scheduleNotification;
- (int)clearSessionStatus;
- (void)updateUsageStats:(surveyAnswerDetails)int int:(isEntityLoggedIn)int;
- (int)getCurrentLocation:(isDataDecrypted)int;
- (int)handleHttpError;
- (void)getActivityLog:(entityTaskStatus)int;
- (int)logError:(appThemeSettings)int int:(feedbackResponse)int;
- (void)logAnalyticsEvent;
@end