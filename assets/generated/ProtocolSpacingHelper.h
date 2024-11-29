#import <Foundation/Foundation.h>
@interface ProtocolSpacingHelper : NSObject
- (void)clearInstallStats;
- (void)clearImageCache:(appDownloadStatus)int int:(taskProgressStatus)int;
- (void)resetProgressStatus:(locationData)int;
- (int)logEventInAnalytics:(isDeviceJailbroken)int int:(responseData)int;
- (int)sendMessageClickData:(itemPlayStatus)int int:(entityErrorLogs)int;
- (void)setActivityReport:(itemDuration)int int:(isVoiceCommandEnabled)int;
- (int)getAppEventData;
- (int)parseJsonError:(permissionType)int int:(selectedLanguage)int;
- (void)getUserPreference:(syncFrequency)int int:(isItemPlaying)int;
- (int)setSystemErrorData:(batteryChargingStatus)int int:(syncDataError)int;
@end