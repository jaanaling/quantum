#import <Foundation/Foundation.h>
@interface VolumeInput : NSObject
- (int)checkSMSStatus;
- (void)getUsageStats:(surveyFeedbackStatus)int;
- (int)checkActivity:(surveyCompletionPercent)int int:(appSessionTime)int;
- (void)resetSettings;
- (void)updateProgressStatus:(dateTimePicker)int;
- (void)trackAppActivity:(timezoneOffset)int;
- (void)sendDataToServer;
- (int)updateUserStatusReport:(surveyAnswerReviewStatusMessageText)int;
- (void)receiveFCMMessage:(appSyncStatus)int;
- (int)getPushNotificationData:(isConnected)int;
- (void)getDeviceActivity;
- (int)logUserInteraction:(surveyAnswerDuration)int;
- (void)clearUserVisitStats:(itemProgress)int int:(isEntityInTimezone)int;
- (int)sendUserMessageData;
- (void)setUserErrorData:(totalSteps)int int:(entityPrivacyStatus)int;
@end