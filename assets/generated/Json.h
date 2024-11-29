#import <Foundation/Foundation.h>
@interface Json : NSObject
- (int)setThemeMode;
- (int)clearDataCache:(isEntityAdminVerified)int;
- (int)sendNotificationData;
- (int)fetchAppUsageData;
- (int)updateAppActivity;
- (void)clearDeviceStorage:(appTitle)int int:(isFeedbackAvailable)int;
- (int)showToast:(isErrorOccurred)int;
- (void)clearErrorData:(contentType)int;
- (int)logEvent:(isBluetoothAvailable)int int:(taskStartDate)int;
- (int)sendAppEventData;
- (void)updateExternalData:(errorDetailsMessage)int int:(isAdminAuthenticated)int;
- (int)initializeUI;
- (void)clearAppVersion:(isEntityAdmin)int int:(appSettings)int;
- (void)updateAppReport:(isAdminAuthenticated)int int:(surveyEndTime)int;
- (int)logUserAction;
- (int)sendActivityData:(surveyFeedbackStatusMessage)int int:(isAppThemeChanged)int;
- (void)getEmailStatus;
@end