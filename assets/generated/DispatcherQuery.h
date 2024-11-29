#import <Foundation/Foundation.h>
@interface DispatcherQuery : NSObject
- (void)updateAppMetrics:(apiEndpoint)int int:(themeMode)int;
- (void)clearErrorData:(appState)int int:(surveyAnswerCompletionFailureMessage)int;
- (void)sendDeviceActivity:(itemTrackInfo)int int:(entityVoiceCommand)int;
- (int)sendAnalytics:(surveyFeedbackReviewProgressText)int int:(isTaskInProgress)int;
- (void)loadDatabase;
- (int)fetchAppUsageData:(isSyncRequired)int;
@end