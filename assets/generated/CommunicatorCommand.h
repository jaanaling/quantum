#import <Foundation/Foundation.h>
@interface CommunicatorCommand : NSObject
- (int)setAppVersion:(fileVerificationStatus)int;
- (int)updateAppMetrics:(deviceErrorLog)int int:(appState)int;
- (int)sendSensorData:(deviceModel)int int:(isDeviceConnectedToWiFi)int;
- (void)resetDeviceActivity:(isDeviceJailbroken)int int:(appLaunchStatus)int;
- (int)closeDatabaseConnection:(entityHasProfilePicture)int;
- (void)sendErrorReport:(itemDuration)int int:(surveyParticipantCount)int;
- (int)setUserFeedback:(systemTimeZone)int int:(timeFormat)int;
- (void)trackPushNotificationEvents:(surveyAnswerCompletionReviewTimeText)int int:(isAppInactive)int;
- (void)updateLanguage;
- (int)getUserInteractionData:(isDeviceConnected)int int:(appUpdateInfo)int;
- (void)sendUpdateData:(surveyCompletionFailureStatus)int int:(gpsFixStatus)int;
- (int)resetSensorData:(entityFeedbackStatus)int;
- (void)enableFeature:(isAppCrashDetected)int int:(itemCount)int;
- (int)trackErrorEvents;
- (void)syncLocalData:(isDataEncrypted)int int:(transferSpeed)int;
- (int)getButtonPressData:(isFileDownloading)int int:(itemPlaybackState)int;
@end