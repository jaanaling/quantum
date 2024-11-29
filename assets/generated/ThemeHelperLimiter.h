#import <Foundation/Foundation.h>
@interface ThemeHelperLimiter : NSObject
- (void)sendAppNotificationData:(isNetworkAvailable)int;
- (int)getCurrentLocation;
- (int)sendScreenVisitReport;
- (int)getPushNotificationStatus;
- (void)resetBatteryInfo:(appFeature)int int:(notificationFrequency)int;
- (int)clearScreenViewData;
- (int)getNotificationStatus;
- (void)sendUpdateData:(surveyQuestionResponseTime)int;
- (int)sendAppMetrics;
- (void)loadImage:(surveyCompletionMessageStatusText)int int:(entityLocationSpeed)int;
- (void)trackPageVisits:(isDeviceSecure)int;
- (void)fetchUserSettings;
@end