#import <Foundation/Foundation.h>
@interface ScalerExcel : NSObject
- (void)getLocation;
- (int)checkPermissionStatus:(responseData)int int:(isDataEncrypted)int;
- (void)getErrorEventData:(gpsSignalQuality)int int:(reportTitle)int;
- (void)checkReminderStatus:(isTutorialSkipped)int;
- (void)updateUserSessionDetails;
- (int)checkPermissions;
- (void)trackNotificationEvents:(isConnected)int;
- (int)updateActivity;
- (void)checkLocationPermissions;
- (void)sendScreenVisitReport:(systemTimeZone)int int:(isDeviceInDoNotDisturbMode)int;
- (void)updateScreenVisitData;
- (void)loadPreference:(surveyAnswerReviewCompletionMessageText)int int:(deviceStorage)int;
@end