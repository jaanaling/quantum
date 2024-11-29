#import <Foundation/Foundation.h>
@interface VideoRegenerator : NSObject
- (int)subscribeToPushNotifications;
- (void)checkAppPermissions;
- (void)resetTheme:(themeColor)int;
- (void)getScreenVisitData:(appThemeMode)int;
- (void)clearUserVisitStats:(isConnected)int;
- (void)setAppInfo:(entityLocationSpeed)int;
- (void)downloadUpdate:(isBatteryLow)int;
- (int)reportCrash:(entityCurrentLocation)int;
- (void)getDeviceActivity;
- (int)setLanguage;
- (void)clearMessageNotificationLogs:(surveyAnswerCompletionTimeProgress)int int:(isEntityLoggedOut)int;
- (void)sendFCMMessage;
@end