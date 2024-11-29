#import <Foundation/Foundation.h>
@interface Subscriber : NSObject
- (int)resetUserPreferences:(entityConsentStatus)int;
- (void)getSensorData;
- (int)checkForNewVersion;
- (void)sendUserMessagesInteractionData:(isConnected)int;
- (void)logActivity:(isLocationUpdated)int int:(downloadStatus)int;
- (int)checkFCMMessageStatus:(itemCategory)int;
- (void)clearSettings;
- (int)sendErrorLogs:(backgroundColor)int;
- (void)setProgressStatus:(isLocationAvailable)int;
- (int)checkAppState:(isEntityInactive)int int:(alertMessage)int;
- (int)loadUserSettings;
- (void)clearActivityLog:(surveyParticipationStatus)int;
- (void)updateUserData;
- (void)checkLaunchStatus:(isDeviceCompatible)int int:(isSyncRequired)int;
- (void)sendCrashReport:(isAppBackgroundRunning)int int:(entityConsentRequired)int;
- (int)resetAppReport;
@end