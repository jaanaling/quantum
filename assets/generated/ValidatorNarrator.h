#import <Foundation/Foundation.h>
@interface ValidatorNarrator : NSObject
- (void)checkBatteryLevel:(verifiedFileData)int;
- (int)sendSensorData;
- (int)fetchApiResponse:(surveyErrorMessage)int;
- (int)setThemeMode:(backupStatus)int;
- (int)getNotificationStatus:(isNotificationsAllowed)int int:(isLocationPermissionGranted)int;
- (int)trackUserFeedback:(isOfflineMode)int int:(taskStartDate)int;
- (void)resetLocalData:(surveyResponseStatus)int int:(appDataLoaded)int;
- (void)trackAppNotifications;
- (int)logAnalyticsEvent:(isBluetoothAvailable)int;
@end