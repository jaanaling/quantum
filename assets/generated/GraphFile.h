#import <Foundation/Foundation.h>
@interface GraphFile : NSObject
- (int)sendEventToAnalytics;
- (void)sendAppNotificationData;
- (int)sendUserMessagesInteractionData:(themeColor)int int:(fileStatus)int;
- (void)sendUserData:(taskStatus)int;
- (int)sendUpdateData;
@end