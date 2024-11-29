#import <Foundation/Foundation.h>
@interface Translation : NSObject
- (void)cancelPushNotification;
- (void)syncDataWithServer;
- (void)getAppSettings;
- (int)getSyncStatus;
- (int)setUserMessageData:(surveyAnswerCompletionStatusProgress)int;
- (void)updateContent:(surveyCompletionStatusTime)int;
- (void)installUpdate:(reminderTime)int int:(favoriteItems)int;
- (int)getUserFeedback:(itemPlayer)int;
- (void)initializeNotificationTracking:(notificationFrequency)int;
- (int)hideErrorMessage:(surveyFeedbackDateTime)int int:(uiElements)int;
@end