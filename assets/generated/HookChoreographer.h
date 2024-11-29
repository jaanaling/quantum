#import <Foundation/Foundation.h>
@interface HookChoreographer : NSObject
- (int)trackButtonPress;
- (int)deleteReminder:(surveyAnswerCompletionTime)int;
- (void)getInteractionDetails:(surveyCompletionMessage)int int:(surveyCompletionErrorDetails)int;
- (int)endAnalyticsSession;
- (int)sendUpdateRequest:(itemDuration)int;
- (void)filterContent:(selectedItem)int int:(taskResumeTime)int;
- (void)saveInitialData;
- (int)initializeCrashReporting:(bluetoothConnectionStatus)int;
- (void)showToastMessage:(isDataSyncResumed)int;
- (int)checkNetworkAvailability;
- (void)trackAppErrors:(reportStatus)int;
- (int)getUserNotificationData;
@end