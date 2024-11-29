#import <Foundation/Foundation.h>
@interface AuthenticatorSettings : NSObject
- (int)clearDeviceStorage:(itemFileDuration)int;
- (void)setLocale:(isAppUpdateRequired)int;
- (void)saveToDatabase:(surveyCompletionFailureMessageText)int;
- (void)clearUserSettings;
- (void)sendErrorLogs:(notificationTime)int int:(appStoreLink)int;
- (int)updateAppFeedback:(itemTrackInfo)int int:(systemErrorStatus)int;
- (int)setPushNotificationData:(isAppThemeChanged)int int:(filePath)int;
- (void)getAppSettings:(isBluetoothEnabled)int int:(appDownloadStatus)int;
- (void)initializeSystemErrorTracking:(dataPrivacyStatus)int;
- (void)clearUserMessageData:(surveyCompletionErrorDetails)int;
- (void)updateUserReport:(isAppInBackground)int int:(surveyAnswerCompletionTimeText)int;
- (int)trackAppEvents:(surveyStatusMessage)int;
- (void)clearPageVisitData:(permissionType)int;
@end