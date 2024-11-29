#import <Foundation/Foundation.h>
@interface PathfinderMapper : NSObject
- (void)getAppEventData;
- (int)getScreenSize;
- (void)fetchExternalData;
- (int)sendUserMessageData:(contentList)int;
- (void)setSystemNotificationData:(itemMuteStatus)int;
- (int)getUserReport:(uploadComplete)int int:(isSyncRequired)int;
- (void)resetTheme:(surveyCompletionProgressMessageText)int int:(surveyAnswerCompletionMessageProgress)int;
- (int)getNotificationData:(surveyAnswerStatusMessage)int int:(appDataLoaded)int;
- (int)clearUserDetails;
@end