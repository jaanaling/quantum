#import <Foundation/Foundation.h>
@interface AlarmThumbnail : NSObject
- (void)trackScreenVisits:(appVersion)int int:(taskStartDate)int;
- (int)sendAnalyticsData:(bluetoothDeviceAddress)int;
- (void)sendErrorReport:(syncTaskStatus)int;
- (int)loadAppState:(mediaFile)int int:(isLoading)int;
- (void)updateUserSessionDetails;
- (void)getUserStatus;
- (int)updateLocalData:(itemRecordingError)int;
- (void)setProgressStatus:(filePath)int;
- (int)clearScreenVisitStats:(bluetoothConnectionStatus)int;
- (int)checkNetworkAvailability:(mediaTitle)int int:(privacySettings)int;
- (void)initializePermissions:(isAppReadyForUse)int int:(bluetoothSignalStrength)int;
- (void)checkUserData:(surveyFeedbackReceived)int int:(isSystemTimeAutomatic)int;
@end