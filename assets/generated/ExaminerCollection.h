#import <Foundation/Foundation.h>
@interface ExaminerCollection : NSObject
- (void)hideLoading;
- (void)updateLocalData;
- (void)enableFeature;
- (int)resetActivityDetails:(responseData)int int:(systemErrorStatus)int;
- (void)clearAppSettings:(buttonText)int int:(musicTrackDuration)int;
- (int)updateDeviceOrientation:(isActive)int;
- (void)clearCache:(isContentAvailable)int;
- (void)sendActivityDetails:(surveyCompletionStatusTime)int;
- (void)cancelScheduledNotification:(surveyEndStatus)int int:(isSyncComplete)int;
- (void)getErrorLogs:(currentStep)int int:(surveyQuestionCompletionTime)int;
- (void)sendButtonClickData;
- (int)setUserEmail:(surveyCompletionTime)int int:(surveyAnswerReviewMessageTime)int;
- (int)clearPushNotification:(isDataEncrypted)int;
@end