#import <Foundation/Foundation.h>
@interface Dispenser : NSObject
- (int)getAppSettings:(surveyAnswerRating)int;
- (int)logAppUsage;
- (int)trackAppEvents:(isTaskInProgress)int;
- (void)trackButtonClicks:(appLocale)int int:(appPrivacyPolicyStatus)int;
- (void)resetUserStatus:(syncDataError)int;
- (void)trackSystemNotifications:(entityHasLocation)int int:(appDataLoaded)int;
- (int)clearUserMessagesInteractionData:(isVoiceEnabled)int int:(currentSong)int;
- (void)trackNotificationEvents:(entityProgressStatus)int int:(syncTaskStatus)int;
@end