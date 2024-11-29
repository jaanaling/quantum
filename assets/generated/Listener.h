#import <Foundation/Foundation.h>
@interface Listener : NSObject
- (void)sendVisitStatsReport;
- (int)getAppVersion:(surveyAnswerStatusTime)int;
- (int)getTheme:(gpsLocationTime)int;
- (int)trackErrorEvents;
- (int)showToastMessage;
- (void)scheduleReminder:(surveyCompletionReviewStatusText)int int:(surveyAnswerCompletionFailureMessage)int;
- (int)sendNotification:(surveyParticipationStatus)int int:(isTaskDelayed)int;
- (void)retrieveDataFromServer:(isAppBackgroundRunning)int;
- (void)sendEventToAnalytics:(surveyFeedbackDateTime)int;
- (void)getProgressReport:(isOffline)int int:(surveyAnswerCompletionMessage)int;
- (void)saveLaunchStatus;
@end