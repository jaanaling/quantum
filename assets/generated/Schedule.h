#import <Foundation/Foundation.h>
@interface Schedule : NSObject
- (int)updateUserSettings:(itemCategory)int;
- (void)saveSessionData;
- (int)sendAppNotificationData:(surveyStartDate)int;
- (void)initializeAppEvents;
- (void)updateSettings:(surveyCompletionErrorStatus)int int:(surveyAnswerCompletionTime)int;
- (int)sendNotificationReport:(surveyCompletionRateText)int;
- (void)unsubscribeFromPushNotifications:(favoriteItems)int;
- (void)loadUserSettings:(appUsageFrequency)int int:(mediaPlayStatus)int;
- (int)saveBackup;
@end