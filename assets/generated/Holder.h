#import <Foundation/Foundation.h>
@interface Holder : NSObject
- (void)sendProgressReport;
- (void)loadAppState:(isAppRunning)int int:(appUsageFrequency)int;
- (void)updateDeviceOrientation;
- (void)loadDatabase;
- (int)getCrashReports:(isVoiceEnabled)int;
- (void)getUserReport;
- (void)fetchExternalData:(isFeedbackAvailable)int int:(isAdminAuthenticated)int;
- (int)filterContent:(itemFileDuration)int int:(isConnected)int;
- (int)trackScreenVisits:(isSyncComplete)int;
- (int)logCrashLogs:(surveyCompletionSuccessStatus)int;
- (void)deleteDataFromDatabase;
- (void)updateUserStatus;
- (int)getScreenViewData:(isEntityInProgress)int;
- (int)logScreenView:(bluetoothDeviceAddress)int int:(geofenceRegion)int;
- (int)clearUserData:(isTrackingEnabled)int int:(surveyResponsesReviewed)int;
@end