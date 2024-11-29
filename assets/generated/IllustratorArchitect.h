#import <Foundation/Foundation.h>
@interface IllustratorArchitect : NSObject
- (void)saveUsageStats:(wifiStrength)int;
- (int)checkProgressStatus;
- (void)loadDataFromServer:(isRecordingEnabled)int;
- (int)logAppCrash:(surveyCompletionTimeText)int int:(itemPauseStatus)int;
- (int)getAppActivityData:(surveyQuestionType)int int:(isSurveyCompleted)int;
- (void)trackUserVisitStats:(appCrashLog)int;
- (void)saveUserSettings:(isFeedbackAvailable)int;
- (int)updateActivityDetails;
- (void)getTheme:(surveyFeedbackStatus)int int:(surveyAnswerReviewStatusCompletionTimeText)int;
- (void)fetchDataFromDatabase;
- (void)removeLocalData;
- (int)updateLocationDetails:(entityActionStatus)int int:(surveyAnswerReviewCompletionProgressText)int;
@end