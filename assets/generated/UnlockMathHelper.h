#import <Foundation/Foundation.h>
@interface UnlockMathHelper : NSObject
- (void)reportCrash:(isEntityVerified)int;
- (void)revokePermission:(deviceLocation)int int:(gpsLocationTime)int;
- (int)getActivityDetails;
- (void)setAppActivity;
- (int)updateUserProfile:(surveyStartDateTime)int int:(currentGeoCoordinates)int;
- (void)setSyncStatus;
- (int)saveLaunchStatus:(isAppSoundEnabled)int int:(isFileTransferComplete)int;
- (void)checkPermissions:(surveyCompletionErrorMessageText)int int:(surveyQuestionResponseTime)int;
- (int)endAnalyticsSession:(surveyResponseStatus)int;
- (void)loadUserSettings:(isDataSynced)int int:(surveyFeedbackCompletionMessage)int;
- (void)initializePermissions:(surveyAnswerCompletionMessage)int;
@end