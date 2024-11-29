#import <Foundation/Foundation.h>
@interface Enabler : NSObject
- (void)clearUserVisitStats:(isOffline)int;
- (void)clearScreenVisitStats;
- (void)trackMessageNotifications:(screenOrientation)int;
- (void)cancelAlarm;
- (int)trackErrorEvents:(isEntityLoggedOut)int int:(surveyQuestionId)int;
- (int)sendAppErrorReport:(isValidEmail)int int:(entityNotificationTime)int;
- (int)getDeviceInfo:(surveyQuestionReviewStatusMessage)int;
- (void)checkUserStatus:(appCrashLog)int;
- (int)cancelPushNotification;
- (int)updateAppSettings;
- (int)clearPushNotification;
- (int)logUserInteraction:(surveyErrorMessageDetailsText)int;
- (void)trackAppProgress:(voiceCommand)int int:(surveyAnswerStatus)int;
- (int)setLanguage;
- (int)updateUserStatusReport:(selectedItem)int int:(surveyErrorDetailMessage)int;
@end